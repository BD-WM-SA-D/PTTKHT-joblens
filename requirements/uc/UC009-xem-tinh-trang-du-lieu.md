# UC009 – Xem tình trạng dữ liệu

| | |
|---|---|
| **Actor chính** | Quản trị dữ liệu |
| **Mức** | P1 |
| **Mô tả** | Xem nhanh dữ liệu từng nguồn có mới và có lỗi không (chỉ đọc; vận hành pipeline làm trên Airflow/Grafana của BD) |
| **Tiền điều kiện** | Đăng nhập với vai trò `admin` |
| **Hậu điều kiện** | Bảng tình trạng hiển thị |

## Luồng chính

1. Quản trị mở trang Tình trạng dữ liệu.
2. Hệ thống lấy số liệu mới nhất theo nguồn (TopCV, ITviec, VietJobs).
3. Hệ thống hiển thị: lần crawl cuối, lần cập nhật silver cuối, số tin đang mở, tin mới 24 giờ, tỉ lệ lỗi parse 24 giờ, tỉ lệ Great Expectations đạt.
4. Hệ thống tô đỏ nguồn có lần crawl cuối > 24 giờ hoặc tỉ lệ lỗi parse > 5%.

## Ngoại lệ

- **Không phải admin:** trả 403.
- **Bảng chưa có dữ liệu:** hiển thị "Chưa có số liệu".

## Quy tắc nghiệp vụ

- BR-17: Chỉ hiển thị, không phân tích lại số liệu của BD (quy tắc R4).

## Dữ liệu

`gold.data_status`. API cổng: `GET /api/admin/data-status`.
