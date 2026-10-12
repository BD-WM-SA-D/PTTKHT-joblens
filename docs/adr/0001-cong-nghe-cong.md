# ADR-app 0001 – Công nghệ cổng JobLens

| | |
|---|---|
| **Trạng thái** | ĐỀ XUẤT – chờ nhóm SA&D duyệt |
| **Ngày** | 2026-10-12 |
| **Người soạn** | Hoang Le (nháp bằng Claude Code) – xem `docs/ai-log.md` |

## Bối cảnh

Cổng cần: tách lớp rõ để vẽ ECB, trình tự và kiểm thử API độc lập (chương 4–6 của báo cáo); chạy được một mình với gold mẫu; gọi Trino, `mining-service`, Kafka; lưu tài khoản và hồ sơ kỹ năng.

## Quyết định

| Tầng | Chọn | Lý do |
|---|---|---|
| API | **FastAPI** (Python 3.12) | Cùng ngôn ngữ với hai repo kia và `joblens-contracts`; sinh OpenAPI tự động; `Depends` cho dependency injection (đổi adapter theo môi trường) |
| Web | **React + Vite** (TypeScript) | Tách hẳn Presentation khỏi API; SPA dễ gọi API cổng |
| CSDL ứng dụng | **PostgreSQL** (schema `app`), SQLAlchemy + Alembic | Dữ liệu giao dịch có ràng buộc (email duy nhất, khóa ngoại); cụm BD đã có PostgreSQL |
| Đọc lakehouse | `trino-python-client`; **DuckDB** đọc gold mẫu khi chạy local | Đáp ứng NFR-07 (chạy độc lập) |
| Kafka | `confluent-kafka`; hàng đợi trong bộ nhớ khi chạy local | |
| Xác thực | Email + mật khẩu (argon2), token JWT 24 giờ | Đủ cho phạm vi; không cần OAuth |
| Kiểm thử | `pytest` + `pytest-bdd` chạy file `.feature` trong `tests/acceptance/` | Kịch bản Given/When/Then chạy được, làm bằng chứng chương 6 |
| Đóng gói | Docker; `docker compose` cho local | NFR-08 |

## Phương án đã cân nhắc

| Phương án | Vì sao không chọn |
|---|---|
| Streamlit | Giao diện và logic chung một file, không có lớp Boundary/Control rõ để vẽ ECB và kiểm thử API |
| Django | Nặng hơn nhu cầu; ORM và template gắn chặt, khó tách SPA |
| FastAPI + Jinja/HTMX | Hợp lý nếu nhóm không quen React; giữ làm phương án dự phòng, vẫn tách được lớp |

## Hệ quả

- Cấu trúc thư mục `api/` theo routers/services/domain/repositories/clients/messaging (blueprint mục 9.3).
- Biến môi trường chọn adapter: `JOBLENS_TRINO_HOST`, `JOBLENS_MINING_URL`, `JOBLENS_SEARCH_URL`, `JOBLENS_KAFKA_BOOTSTRAP`.
