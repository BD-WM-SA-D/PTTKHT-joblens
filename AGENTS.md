<!-- ĐỒNG BỘ TỪ joblens/docs/project-plan/templates/AGENTS.md + agents/pttkht.md – sửa ở đó trước, không sửa tại đây -->
# Hướng dẫn cho AI agent

Áp dụng cho mọi AI agent làm việc trong repo này: Codex, Claude Code, Cursor, Copilot… Người dùng nói khác thì làm theo người dùng, nhưng phải nhắc lại quy tắc bị bỏ qua.

## Bối cảnh

JobLens VN là đồ án liên môn học kỳ 20261. Một hệ thống được chia thành 4 repo trong org `BD-WM-SA-D`:

| Repo | Vai trò |
|---|---|
| `joblens` | Dùng chung: schema Kafka, contract bảng, fixtures, glossary, phiên bản, tài liệu kế hoạch |
| `Big-Data-Storage-and-Processing-joblens` | Môn IT4931 Big Data: Kafka, Spark, Iceberg, dbt, GX, Airflow, Trino, K8s |
| `Web-mining-joblens` | Môn Web Mining: crawler, dedup, IE, ABSA, IR, RecSys, đồ thị |
| `PTTKHT-joblens` | Môn IT3120 SA&D: cổng JobLens (API + UI), UML, yêu cầu, kiểm thử chấp nhận |

Mỗi repo là bài nộp của **một** môn. Mỗi artifact chỉ có **một** môn chấm chính. Code đặt sai repo làm hỏng tính độc lập của bài nộp.

Tài liệu gốc:
- File nào lên repo nào: `joblens/docs/repo-routing.md`.
- Quy tắc làm việc: `joblens/docs/project-plan/09-quy-tac-lam-viec-chung.md`.
- Ma trận sở hữu: `joblens/docs/project-plan/07-quy-tac-phan-tach-mon.md`.

## Ngôn ngữ

- Tài liệu, comment, mô tả commit/PR, nhật ký viết bằng **tiếng Việt có dấu**.
- Tên biến, hàm, file, cột, topic viết bằng tiếng Anh (`snake_case` cho Python/SQL).

## Mỗi khi tạo hoặc sửa file (bắt buộc)

1. **Xác định repo đích** bằng bảng "Tra nhanh" ở đầu `joblens/docs/repo-routing.md` (chi tiết ở mục A–F) và mục "Phạm vi repo này" ở cuối file này. Nếu file không thuộc repo đang mở thì **không tạo**: báo người dùng repo đúng và phần việc cần làm ở đó. Nếu bảng không có loại file này thì hỏi người dùng.
2. **Tôn trọng dòng đánh dấu.** File có dòng đầu `ĐỒNG BỘ TỪ …` hoặc `SINH TỪ …` thì **không sửa tại chỗ**. Chỉ ra bản gốc cần sửa (thường ở `joblens/docs/project-plan/templates/` hoặc `joblens/schemas/`).
3. **Thêm dòng đánh dấu** khi tạo file mục C (`ĐỒNG BỘ TỪ`), mục E (`LIÊN QUAN: <repo>/<file>`) hoặc file sinh từ schema (`SINH TỪ … @ vX.Y.Z`).
4. **Đánh dấu việc dùng AI.** Khi commit, thêm dòng `AI: <công cụ> – <phần nào>` cuối commit message.
   - Việc thường ngày không cần ghi `NHAT-KY.md`.
   - Chỉ ghi nhật ký (vài dòng, mục mới trên cùng) khi đổi hợp đồng hoặc file cấu hình chung, khi ghép hệ thống hay chốt số liệu.
   - Nếu thay đổi chạm hợp đồng ở `joblens`, nhắc người dùng **nhắn nhóm chat**.
   - **Không tự điền tên người kiểm tra**, để `<người kiểm tra>`.

## Không bao giờ làm

- **Commit những thứ cấm:**
  - Bí mật: `.env`, key, token, kubeconfig.
  - Dữ liệu crawl, HTML thô, dump Kafka, warehouse Iceberg.
  - Tập nhãn, file model (`*.pt`, `*.bin`, `*.safetensors`, `*.onnx`, `*.pkl`).
  - Dữ liệu cá nhân (tên, email, SĐT, CV).
  - Slide hay tài liệu của giảng viên.
  - Output notebook.
- **Lách bộ chặn:**
  - Không dùng `--no-verify`.
  - Không sửa `.gitignore` hay `.pre-commit-config.yaml` để cho file cấm đi qua.
- **Thao tác git và GitHub nguy hiểm:**
  - Không push khi người dùng chưa yêu cầu.
  - Không force-push, không viết lại lịch sử đã push.
  - Không merge PR thay người.
  - Không tạo hay xóa repo, không đổi cài đặt org/repo.
- **Thu thập dữ liệu sai quy tắc:**
  - Không chạy crawler thật khi chưa được yêu cầu rõ.
  - Không lách robots.txt hay chống bot, không thêm đăng nhập vào trang nguồn.
  - Không vượt 1 request/giây/domain, không chạm đường dẫn CV.
- **Tải nặng vào repo:** không tải dataset lớn hay model vào repo, không gửi dữ liệu crawl cho dịch vụ bên ngoài.
- **Ghi vào bảng hay topic của repo khác** (quy tắc 2): cần dữ liệu thì đọc, hoặc mở issue `cross-repo`.
- **Bịa thông tin:**
  - Tên thành viên, MSSV, ngày giảng viên đồng ý, mã môn.
  - Số liệu thí nghiệm, benchmark, metric.
  - Chỗ chưa biết thì giữ dạng `<...>`.
- **Lẫn báo cáo giữa các môn:** không viết nội dung báo cáo của môn khác vào repo này, không chép nguyên văn đoạn văn giữa các báo cáo (R3), không dán cùng một hình vào hai báo cáo (R5).
- **Dùng `latest`:** không dùng tag `latest` cho image hay phiên bản thư viện. Phiên bản pin nằm ở `joblens/versions.md`.

## Đổi schema hay hợp đồng dữ liệu

- Sửa ở `joblens` **trước**, rồi mới sửa code ở repo môn. Không tạo bản sao schema trong repo môn.
- Thêm trường hoặc cột không bắt buộc thì làm được ngay. **Đổi tên hoặc xóa** thì báo người dùng: phải hỏi nhóm đang dùng hợp đồng đó trước.
- Đang làm ở repo môn mà thấy cần đổi hợp đồng thì nói rõ cần đổi gì ở `joblens`, không tự chế cách lách.

## Git

- Trong repo môn, nhóm được push thẳng `main`. Agent chỉ commit hoặc push khi người dùng yêu cầu.
- Commit theo Conventional Commits, ví dụ `feat(crawler): thêm adapter ITviec`.
- Ở repo `joblens` nên dùng nhánh và PR để CI chạy. Việc cần repo khác làm thì gợi ý mở issue `cross-repo` ở repo đó.

## Trước khi báo xong

- Chạy `pre-commit run --all-files` và test của repo (xem "Phạm vi repo này"). Báo lệnh đã chạy và kết quả thật.
- Bước nào không chạy được thì nói rõ là chưa kiểm tra, không viết "đã xong".
- Tóm tắt: file đã tạo, sửa, xóa; mục nhật ký đã ghi; việc còn lại ở repo khác (nếu có).

## Hỏi người dùng thay vì đoán khi

- Không xác định được file thuộc repo nào.
- Đổi tên hoặc xóa trường, cột, bảng, topic trong hợp đồng.
- Xóa file hay thư mục có sẵn.
- Yêu cầu mâu thuẫn với quy tắc ở trên.

## Phạm vi repo này: `PTTKHT-joblens` (IT3120 Phân tích thiết kế hệ thống)

Câu hỏi môn chấm: hệ thống phục vụ *ai*, cần *đáp ứng gì*, được *thiết kế* thế nào.

**Thuộc về đây:**
- `api/`, `web/`: cổng JobLens.
- `uml/`: **toàn bộ** sơ đồ UML, gồm use case, lớp ECB, trình tự, máy trạng thái, gói, deployment. Định dạng `.puml` hoặc `.drawio`.
- `requirements/`: user story, đặc tả UC001–UC010, NFR.
- `tests/acceptance/`: kịch bản Given/When/Then.
- `scripts/make_sample_gold.py`: sinh gold mẫu (DuckDB/Parquet) từ fixtures. Chỉ commit script, không commit file sinh ra.
- `docs/` (nguồn báo cáo 7 chương), `docs/adr/`, `docs/ai-log.md`.

**Không thuộc về đây:**
- Code xử lý dữ liệu, Helm, dbt, DAG, benchmark → `Big-Data-Storage-and-Processing-joblens`.
- Crawler, mô hình khai phá → `Web-mining-joblens`.
- Schema bảng gold → `joblens`.

**Quy tắc riêng:**
- **Chỉ đọc gold** qua Trino (hoặc gold mẫu khi chạy local) và gọi API tìm kiếm `schemas/api/search.v1.yaml`; khi không có `JOBLENS_SEARCH_URL` thì lùi về tìm bằng Trino.
- Topic duy nhất app được ghi là `app.alert_subscriptions.v1`. App đọc `alerts.job_match.v1` để gửi cảnh báo UC006 (ADR 0001 D4b). Không ghi bảng nào.
- **Số đo hiệu năng của Big Data** chỉ được *trích* làm bằng chứng NFR, kèm tag `report-bd-v1`, không phân tích lại (R4).
- **Sơ đồ** vẽ theo ký pháp UML của môn này. Không dán sơ đồ Helm hay sơ đồ luồng dữ liệu của Big Data (R5).
- **Human-AI collaboration là một phần được chấm.** Mỗi lần AI hỗ trợ phân tích hay thiết kế (nháp user story, rà NFR, gợi ý sơ đồ…) phải ghi **thêm** vào `docs/ai-log.md`: ngày, công cụ, việc AI làm, phần người chỉnh, người kiểm tra (để `<người kiểm tra>` nếu chưa có).
- Phải chạy được một mình với gold mẫu sinh từ fixtures, không cần Trino.

**Lệnh kiểm tra:** `pre-commit run --all-files`. Khi đã có code thì thêm `pytest -q` và chạy các kịch bản trong `tests/acceptance/`.
