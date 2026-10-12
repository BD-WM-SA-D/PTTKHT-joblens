# UC012 – Nhận gợi ý việc làm

| | |
|---|---|
| **Actor chính** | Thành viên |
| **Actor phụ** | Dịch vụ khai phá (`mining-service`), Nền tảng dữ liệu (Trino) |
| **Mức** | P0 |
| **Mô tả** | Hệ thống chủ động đề xuất các tin đang mở phù hợp hồ sơ kỹ năng, kèm lý do (kỹ năng khớp, kỹ năng thiếu) |
| **Quan hệ** | «include» Lấy hồ sơ kỹ năng; được mở rộng bởi UC013, UC006 |
| **Tiền điều kiện** | Đã đăng nhập; đã có hồ sơ kỹ năng (UC004) |
| **Hậu điều kiện** | Danh sách gợi ý hiển thị; không thay đổi dữ liệu |
| **User story** | US-03 |

## Luồng chính

1. Thành viên mở trang chủ hoặc trang Gợi ý.
2. Hệ thống lấy hồ sơ kỹ năng của thành viên.
3. Hệ thống gửi danh sách kỹ năng tới dịch vụ khai phá (`POST /v1/recommend`, k = 10, kèm địa điểm nếu thành viên chọn).
4. Hệ thống lấy chi tiết các tin được gợi ý (tiêu đề, công ty, địa điểm, lương).
5. Hệ thống hiển thị 10 tin; mỗi tin ghi "khớp a/b kỹ năng", liệt kê kỹ năng khớp và kỹ năng còn thiếu.
6. Thành viên chọn một tin (→ UC011) hoặc xem khoảng trống kỹ năng (→ UC013) hoặc bật cảnh báo (→ UC006).

## Luồng thay thế

- **2a. Chưa có hồ sơ:** hệ thống dẫn tới trang Hồ sơ kỹ năng (UC004).
- **3a. Dịch vụ khai phá không có/lỗi/quá 3 giây:** hệ thống đếm số kỹ năng trùng giữa hồ sơ và từng tin đang mở (`silver.job_skills`), xếp giảm dần (hòa thì tin mới hơn trước), gộp theo `dup_group_id`; ghi nhãn "chế độ đơn giản".
- **5a. Ít hơn 10 tin có ít nhất 1 kỹ năng khớp:** hiển thị số tin có được và gợi ý thêm kỹ năng.

## Ngoại lệ

- **4a. Trino không phản hồi:** báo "Không tải được gợi ý, thử lại sau".

## Quy tắc nghiệp vụ

- BR-01, BR-02 (chỉ tin đang mở, một tin mỗi nhóm trùng).
- BR-09: Tin phải khớp ít nhất 1 kỹ năng mới được gợi ý.

## Dữ liệu

Gọi `POST /v1/recommend` (`mining.v1.yaml`); đường lùi đọc `silver.job_skills`, `silver.job_postings`, `silver.job_dedup` (ADR 0002 của joblens). API cổng: `GET /api/recommendations`.

## NFR liên quan

NFR-01, NFR-03.
