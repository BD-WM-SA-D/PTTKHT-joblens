# UC006 – Đăng ký và nhận cảnh báo tin mới

| | |
|---|---|
| **Actor chính** | Thành viên |
| **Actor phụ** | Nền tảng dữ liệu (Kafka, job streaming ghép cảnh báo của BD) |
| **Mức** | P1 |
| **Mô tả** | Thành viên bật theo dõi hồ sơ; khi có tin mới khớp, hệ thống tạo thông báo trong ứng dụng |
| **Quan hệ** | «extend» UC012 ("Theo dõi hồ sơ này") |
| **Tiền điều kiện** | Đã có hồ sơ kỹ năng |
| **Hậu điều kiện** | Đăng ký ở trạng thái Đang bật; thông báo được tạo khi có tin khớp |

## Luồng chính – Đăng ký

1. Thành viên bấm "Theo dõi hồ sơ này", chọn thêm địa điểm (không bắt buộc).
2. Hệ thống lưu đăng ký (trạng thái Đang bật) và phát message lên `app.alert_subscriptions.v1`.
3. Hệ thống báo đã bật cảnh báo.

## Luồng chính – Nhận cảnh báo (bất đồng bộ)

1. Job streaming của BD ghép tin mới với các đăng ký, ghi `alerts.job_match.v1`.
2. Tiến trình consumer của cổng đọc message, tạo thông báo (chưa đọc) cho thành viên.
3. Khi thành viên mở ứng dụng, biểu tượng chuông hiện số thông báo chưa đọc.
4. Thành viên mở danh sách thông báo, chọn một tin (→ UC011); thông báo chuyển sang Đã đọc.

## Luồng thay thế

- **Tạm dừng / xóa:** thành viên tạm dừng hoặc xóa đăng ký; hệ thống cập nhật trạng thái và phát message mới (cùng `subscription_id`, topic compacted).
- **Thành viên sửa hồ sơ kỹ năng:** hệ thống phát lại đăng ký với danh sách kỹ năng mới.
- **Kafka không có** (chạy local): dùng hàng đợi trong bộ nhớ; nút "Giả lập tin mới" chỉ hiện ở chế độ demo.

## Quy tắc nghiệp vụ

- BR-15: Mỗi thành viên tối đa 3 đăng ký.
- BR-16: Không tạo hai thông báo cho cùng (thành viên, `dup_group_id`).

## Dữ liệu

Ghi `app.alert_subscription`, topic `app.alert_subscriptions.v1`; đọc topic `alerts.job_match.v1`; ghi `app.notification`. API cổng: `POST/PATCH/DELETE /api/alerts`, `GET/PATCH /api/notifications`.

## NFR liên quan

NFR-04 (cảnh báo ≤ 5 phút – trích số đo của BD).
