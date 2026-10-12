# UC001 – Tìm kiếm việc làm

| | |
|---|---|
| **Actor chính** | Khách (Thành viên kế thừa) |
| **Actor phụ** | Dịch vụ khai phá (`search-service`, tùy chọn), Nền tảng dữ liệu (Trino) |
| **Mức** | P0 |
| **Mô tả** | Người tìm việc nhập từ khóa và bộ lọc, nhận danh sách tin đang mở, tin đăng trùng trên nhiều trang chỉ hiện một lần |
| **Tiền điều kiện** | Không |
| **Hậu điều kiện** | Danh sách kết quả hiển thị; không thay đổi dữ liệu |
| **User story** | US-01 ([user-stories.md](../user-stories.md)) |

## Luồng chính

1. Người dùng nhập từ khóa (ví dụ "java fresher") và chọn bộ lọc: địa điểm, cấp bậc, kỹ năng, lương tối thiểu.
2. Hệ thống kiểm tra đầu vào (từ khóa 1–200 ký tự).
3. Hệ thống tìm tin đang mở khớp từ khóa và bộ lọc, xếp hạng theo độ liên quan.
4. Hệ thống gộp các tin cùng `dup_group_id`, giữ tin mới nhất làm đại diện, ghi số trang đăng.
5. Hệ thống hiển thị 20 kết quả đầu: tiêu đề, công ty, địa điểm, lương, kỹ năng chính, "có trên N trang".
6. Người dùng chuyển trang hoặc chọn một tin (→ UC011).

## Luồng thay thế

- **3a. Dịch vụ tìm kiếm không có hoặc lỗi** (không có `JOBLENS_SEARCH_URL`, `/health` lỗi, quá 3 giây): hệ thống tìm bằng truy vấn Trino trên tiêu đề và mô tả, tiếp tục bước 4.
- **5a. Không có kết quả:** hệ thống báo "không tìm thấy" và gợi ý bỏ bớt bộ lọc.
- **1a. (P2) Người dùng gõ câu tự nhiên** "việc java fresher hà nội không OT": hệ thống tách thành bộ lọc (kỹ năng, địa điểm, cấp bậc, khía cạnh review), hiện lại bộ lọc đã tách để người dùng sửa, rồi tiếp tục bước 3.

## Ngoại lệ

- **2a. Đầu vào không hợp lệ:** báo lỗi tại ô nhập, không gửi truy vấn.
- **3b. Trino không phản hồi:** hiển thị "Hệ thống đang bận, thử lại sau"; ghi log lỗi.

## Quy tắc nghiệp vụ

- BR-01: Chỉ hiển thị tin `is_active = true`.
- BR-02: Mỗi `dup_group_id` chỉ một kết quả; tin không có `dup_group_id` coi là nhóm riêng.
- BR-03: Lương hiển thị theo `salary_min_vnd`/`salary_max_vnd`; `salary_is_negotiable` thì ghi "Thỏa thuận".

## Dữ liệu

Đọc `silver.job_postings`, `silver.job_dedup`, `gold.dim_location`; gọi `GET /search` (`joblens/schemas/api/search.v1.yaml`). API cổng: `GET /api/jobs`.

## NFR liên quan

NFR-01 (≤ 3 giây), NFR-03 (đường lùi ≤ 5 giây), NFR-04 (độ tươi ≤ 24 giờ).
