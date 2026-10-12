# ADR-app 0002 – Không lưu văn bản CV

| | |
|---|---|
| **Trạng thái** | ĐỀ XUẤT – chờ nhóm SA&D duyệt |
| **Ngày** | 2026-10-12 |
| **Người soạn** | Hoang Le (nháp bằng Claude Code) – xem `docs/ai-log.md` |

## Bối cảnh

UC004 cho thành viên dán CV để tự trích kỹ năng. CV chứa dữ liệu cá nhân (họ tên, số điện thoại, email, địa chỉ, ngày sinh). Luật Bảo vệ dữ liệu cá nhân 91/2025/QH15 yêu cầu chỉ xử lý dữ liệu cá nhân ở mức cần thiết cho mục đích đã báo.

## Quyết định

1. Văn bản CV chỉ tồn tại trong bộ nhớ của yêu cầu `POST /api/profile/skills/extract`; không ghi vào CSDL, file, cache hay log (kể cả log lỗi).
2. Chỉ lưu danh sách `skill_id` thành viên đã xác nhận, kèm nguồn `extracted`/`manual`.
3. `mining-service` cũng không lưu, không ghi log nội dung (ràng buộc trong `joblens/schemas/api/mining.v1.yaml`, ADR 0002 của joblens).
4. Màn hình Hồ sơ kỹ năng ghi rõ: "Văn bản bạn dán chỉ dùng để trích kỹ năng và không được lưu."

## Hệ quả

- Không có chức năng "xem lại CV đã dán"; muốn trích lại thì dán lại.
- Kiểm thử NFR-05: test tự động gửi văn bản có chuỗi đánh dấu rồi quét CSDL và log, khẳng định không tìm thấy chuỗi đó.
