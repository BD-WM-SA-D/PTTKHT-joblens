# UC005 – Xem đánh giá công ty theo khía cạnh

| | |
|---|---|
| **Actor chính** | Khách (Thành viên kế thừa) |
| **Actor phụ** | Nền tảng dữ liệu (Trino) |
| **Mức** | P0 |
| **Mô tả** | Xem công ty được khen chê thế nào theo từng khía cạnh, kèm câu ví dụ |
| **Tiền điều kiện** | Không |
| **Hậu điều kiện** | Trang công ty hiển thị; không thay đổi dữ liệu |
| **User story** | US-04 |

## Luồng chính

1. Người dùng mở trang công ty (từ UC011 hoặc ô tìm công ty).
2. Hệ thống lấy tổng hợp theo khía cạnh: 5 khía cạnh của ITviec (lương thưởng và phúc lợi, đào tạo và học hỏi, sự quan tâm đến nhân viên, văn hóa công ty, văn phòng làm việc) và cân bằng công việc/OT.
3. Với mỗi khía cạnh, hệ thống hiển thị số câu, tỉ lệ tích cực/tiêu cực/trung tính, điểm sao trung bình (nếu có).
4. Người dùng chọn một khía cạnh.
5. Hệ thống hiển thị tối đa 5 câu ví dụ tích cực và 5 câu tiêu cực của khía cạnh đó.

## Luồng thay thế

- **3a. Khía cạnh có < 10 câu:** hiển thị "Chưa đủ dữ liệu" thay cho tỉ lệ (BR-04).
- **2a. Công ty chưa có review:** báo "Chưa có đánh giá cho công ty này".

## Ngoại lệ

- **1a. `company_key` không tồn tại:** trang 404.

## Quy tắc nghiệp vụ

- BR-04.
- BR-10: Câu ví dụ đã được lọc thông tin cá nhân ở nguồn; hệ thống không hiển thị tên người viết review.
- BR-11: Ghi rõ "Kết quả do mô hình phân tích, có thể sai" dưới biểu đồ.

## Dữ liệu

`gold.mart_company_aspect_sentiment`, `silver.review_aspects` (`sentence_text`), `gold.dim_company`. API cổng: `GET /api/companies/{company_key}/aspects`.

## NFR liên quan

NFR-01.
