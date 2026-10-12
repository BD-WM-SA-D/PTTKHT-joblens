# UC002 – Xem xu hướng nhu cầu kỹ năng

| | |
|---|---|
| **Actor chính** | Khách (Thành viên kế thừa) |
| **Mức** | P1 |
| **Mô tả** | Xem kỹ năng nào được tuyển nhiều nhất và đang tăng/giảm theo tháng |
| **Tiền điều kiện** | Không |
| **Hậu điều kiện** | Dashboard hiển thị |

## Luồng chính

1. Người dùng mở trang Xu hướng (hoặc khối "kỹ năng hot" trên trang chủ).
2. Hệ thống lấy số tin theo kỹ năng của 6 tháng gần nhất.
3. Hệ thống hiển thị top 20 kỹ năng tháng gần nhất (số tin, tỉ lệ, thay đổi so với tháng trước) và biểu đồ đường cho kỹ năng được chọn.
4. Người dùng đổi khoảng thời gian hoặc chọn kỹ năng khác để so sánh (tối đa 5).

## Luồng thay thế

- **3a. Thành viên có hồ sơ:** đánh dấu kỹ năng mình đã có trong top 20; hiện câu "Kỹ năng X của bạn tăng y% so với tháng trước" (hệ thống chủ động).
- **2a. Tháng có < 100 tin:** hiển thị cảnh báo "dữ liệu tháng này ít, số liệu có thể dao động".

## Quy tắc nghiệp vụ

- BR-14: Đếm tin duy nhất theo `dup_group_id` (do BD tính trong mart).

## Dữ liệu

`gold.mart_skill_demand_monthly`, `gold.dim_skill`. API cổng: `GET /api/trends/skills`.
