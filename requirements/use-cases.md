# Ca sử dụng

Phạm vi theo [Blueprint hệ thống](https://github.com/BD-WM-SA-D/joblens/blob/main/docs/project-plan/14-blueprint-he-thong.md) mục 4. Biểu đồ: [`uml/use-case.puml`](../uml/use-case.puml). Đặc tả từng UC: [`uc/`](uc/).

## Actor

| Actor | Loại | Mô tả |
|---|---|---|
| Khách | Người | Người tìm việc chưa đăng nhập |
| Thành viên | Người – kế thừa Khách | Người tìm việc đã đăng nhập |
| Quản trị dữ liệu | Người | Xem tình trạng dữ liệu |
| Nền tảng dữ liệu JobLens | Hệ thống | Trino (dữ liệu đã xử lý), Kafka (cảnh báo) – nhóm BD vận hành |
| Dịch vụ khai phá | Hệ thống | `mining-service` (trích kỹ năng, gợi ý), `search-service` (tìm kiếm) – nhóm WM làm, BD triển khai |

## Danh sách

| UC | Tên | Actor chính | Mức | Đặc tả |
|---|---|---|---|---|
| UC001 | Tìm kiếm việc làm | Khách | P0 | [UC001](uc/UC001-tim-kiem-viec-lam.md) |
| UC011 | Xem chi tiết tin tuyển dụng | Khách | P0 | [UC011](uc/UC011-xem-chi-tiet-tin.md) |
| UC004 | Lập hồ sơ kỹ năng | Thành viên | P0 | [UC004](uc/UC004-lap-ho-so-ky-nang.md) |
| UC012 | Nhận gợi ý việc làm | Thành viên | P0 | [UC012](uc/UC012-nhan-goi-y-viec-lam.md) |
| UC005 | Xem đánh giá công ty theo khía cạnh | Khách | P0 | [UC005](uc/UC005-xem-danh-gia-cong-ty.md) |
| UC010 | Đăng ký / đăng nhập | Khách | P0 | [UC010](uc/UC010-dang-ky-dang-nhap.md) |
| UC002 | Xem xu hướng nhu cầu kỹ năng | Khách | P1 | [UC002](uc/UC002-xem-xu-huong-ky-nang.md) |
| UC013 | Xem khoảng trống kỹ năng | Thành viên | P1 | [UC013](uc/UC013-xem-khoang-trong-ky-nang.md) |
| UC006 | Đăng ký và nhận cảnh báo tin mới | Thành viên | P1 | [UC006](uc/UC006-canh-bao-tin-moi.md) |
| UC009 | Xem tình trạng dữ liệu | Quản trị dữ liệu | P1 | [UC009](uc/UC009-xem-tinh-trang-du-lieu.md) |
| UC003 | So sánh mức lương | Khách | P2 | chưa viết |
| UC007, UC008 | – | – | bỏ | Không dùng lại mã |

**P0** = phải có cho demo đầu tiên · **P1** = phải có trước khi nộp · **P2** = nếu còn thời gian.

## Quan hệ

| Quan hệ | Ý nghĩa |
|---|---|
| UC004 «include» Trích kỹ năng từ văn bản | Lập hồ sơ luôn đi qua bước trích |
| UC012 «include» Lấy hồ sơ kỹ năng | Gợi ý cần hồ sơ |
| UC013 «extend» UC012 | Điểm mở rộng: "xem vì sao chưa khớp" |
| UC011 «extend» UC001 | Chọn một tin trong kết quả |
| UC011 «include» Tóm tắt review công ty | Dùng lại phần hiển thị của UC005 |
| UC006 «extend» UC012 | "Theo dõi hồ sơ này" |
| Thành viên —▷ Khách | Thành viên làm được mọi việc của khách |

## Gói (package)

| Gói | UC |
|---|---|
| Tìm việc | UC001, UC011 |
| Hồ sơ và gợi ý | UC004, UC012, UC013, UC006 |
| Thông tin thị trường | UC002, UC005, UC003 |
| Tài khoản | UC010 |
| Quản trị | UC009 |
