# UC011 – Xem chi tiết tin tuyển dụng

| | |
|---|---|
| **Actor chính** | Khách (Thành viên kế thừa) |
| **Actor phụ** | Nền tảng dữ liệu (Trino) |
| **Mức** | P0 |
| **Mô tả** | Xem đầy đủ một tin: thông tin chuẩn hóa, kỹ năng yêu cầu, các trang đăng tin, tóm tắt review công ty |
| **Quan hệ** | «extend» UC001; «include» Tóm tắt review công ty |
| **Tiền điều kiện** | Người dùng chọn một tin (từ UC001, UC012 hoặc thông báo UC006) |
| **Hậu điều kiện** | Trang chi tiết hiển thị; không thay đổi dữ liệu |
| **User story** | US-05 |

## Luồng chính

1. Người dùng chọn một tin.
2. Hệ thống lấy thông tin tin theo `job_uid`: tiêu đề, công ty, địa điểm, lương, kinh nghiệm, cấp bậc, hạn nộp, mô tả, yêu cầu, quyền lợi.
3. Hệ thống lấy danh sách kỹ năng của tin (đã chuẩn hóa) và các tin cùng nhóm trùng (nguồn + link gốc).
4. Hệ thống lấy tóm tắt review của công ty: 6 khía cạnh, tỉ lệ tích cực/tiêu cực.
5. Hệ thống hiển thị trang chi tiết với link "Xem trên trang gốc".

## Luồng thay thế

- **3a. Người dùng là thành viên có hồ sơ kỹ năng:** hệ thống đánh dấu kỹ năng đã có (khớp) và kỹ năng còn thiếu.
- **3b. Tin chưa có kỹ năng trích** (job mới, DAG chưa chạy): hiển thị tag kỹ năng của nhà tuyển dụng (`skill_tags`) với nhãn "từ nhà tuyển dụng".
- **4a. Công ty chưa có review hoặc mọi khía cạnh < 10 câu:** hiển thị "Chưa đủ dữ liệu đánh giá".
- **2a. Tin đã đóng/hết hạn:** vẫn hiển thị, kèm nhãn "Tin đã đóng"; ẩn nút sang trang gốc nếu link không còn.

## Ngoại lệ

- **2b. `job_uid` không tồn tại:** trang 404 "Không tìm thấy tin".

## Quy tắc nghiệp vụ

- BR-04: Khía cạnh có < 10 câu review không hiển thị tỉ lệ.
- BR-05: Link gốc mở ở tab mới; hệ thống không sao chép nguyên trang nguồn.

## Dữ liệu

`silver.job_postings`, `silver.job_dedup`, `silver.job_skills`, `gold.dim_skill`, `gold.mart_company_aspect_sentiment`; hồ sơ kỹ năng trong CSDL ứng dụng. API cổng: `GET /api/jobs/{job_uid}`.

## NFR liên quan

NFR-01.
