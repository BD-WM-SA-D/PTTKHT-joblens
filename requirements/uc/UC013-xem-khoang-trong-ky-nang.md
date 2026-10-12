# UC013 – Xem khoảng trống kỹ năng

| | |
|---|---|
| **Actor chính** | Thành viên |
| **Mức** | P1 |
| **Mô tả** | Hệ thống chỉ ra kỹ năng nên học thêm để khớp được nhiều tin hơn |
| **Quan hệ** | «extend» UC012 (điểm mở rộng "xem vì sao chưa khớp") |
| **Tiền điều kiện** | Đã có hồ sơ kỹ năng |
| **Hậu điều kiện** | Danh sách kỹ năng gợi ý học hiển thị |

## Luồng chính

1. Thành viên bấm "Nên học thêm gì?" ở trang Gợi ý.
2. Hệ thống xác định tập tin "gần khớp": tin đang mở khớp ≥ 50% kỹ năng yêu cầu nhưng chưa khớp hết.
3. Với mỗi kỹ năng thành viên chưa có, hệ thống đếm số tin gần khớp sẽ khớp thêm nếu có kỹ năng đó.
4. Hệ thống hiển thị top 5 kỹ năng: "Học thêm Spring Boot → khớp thêm 40 tin", kèm 3 tin ví dụ cho mỗi kỹ năng.

## Luồng thay thế

- **2a. Không có tin gần khớp:** gợi ý top kỹ năng phổ biến nhất trong nhóm nghề của hồ sơ (từ UC002).

## Quy tắc nghiệp vụ

- BR-01, BR-02.

## Dữ liệu

`silver.job_skills`, `silver.job_postings`, `gold.dim_skill`. API cổng: `GET /api/recommendations/skill-gap`.
