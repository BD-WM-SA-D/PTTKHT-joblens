# User story

Mẫu: *Là \<vai trò\>, tôi muốn \<việc\>, để \<lợi ích\>.* Mỗi story kiểm theo INVEST (Independent, Negotiable, Valuable, Estimable, Small, Testable). Kịch bản chấp nhận chạy được nằm ở [`tests/acceptance/`](../tests/acceptance/). Điểm ước lượng (story point) để nhóm điền khi lập kế hoạch tuần.

| ID | UC | Story | Mức | Điểm |
|---|---|---|---|---|
| US-01 | UC001 | Là người tìm việc, tôi muốn tìm theo từ khóa và lọc theo địa điểm, cấp bậc, để chỉ xem tin liên quan | P0 | <...> |
| US-05 | UC011 | Là người tìm việc, tôi muốn xem đủ thông tin một tin ở một chỗ (kỹ năng, lương, các trang đăng, review công ty), để quyết định có nộp không | P0 | <...> |
| US-02 | UC004 | Là thành viên, tôi muốn dán CV để hệ thống tự điền kỹ năng, để không phải gõ từng kỹ năng | P0 | <...> |
| US-03 | UC012 | Là thành viên có hồ sơ kỹ năng, tôi muốn thấy các tin phù hợp nhất kèm lý do, để không phải đọc hàng trăm tin | P0 | <...> |
| US-04 | UC005 | Là người tìm việc, tôi muốn xem công ty được khen chê thế nào theo từng khía cạnh, để tránh môi trường không hợp | P0 | <...> |
| US-06 | UC010 | Là khách, tôi muốn tạo tài khoản bằng email, để lưu hồ sơ kỹ năng | P0 | <...> |
| US-07 | UC002 | Là người tìm việc, tôi muốn xem kỹ năng nào đang được tuyển nhiều và tăng nhanh, để chọn cái nên học | P1 | <...> |
| US-08 | UC013 | Là thành viên, tôi muốn biết học thêm kỹ năng nào sẽ mở thêm nhiều tin nhất, để lên kế hoạch học | P1 | <...> |
| US-09 | UC006 | Là thành viên, tôi muốn được báo khi có tin mới khớp hồ sơ, để không bỏ lỡ tin tốt | P1 | <...> |
| US-10 | UC009 | Là quản trị dữ liệu, tôi muốn xem nguồn nào lâu chưa cập nhật hoặc lỗi nhiều, để báo nhóm vận hành trước buổi demo | P1 | <...> |
| US-11 | UC001 | Là người tìm việc, tôi muốn gõ một câu như "java fresher hà nội không OT", để không phải chọn từng bộ lọc | P2 | <...> |

## Tiêu chí chấp nhận

### US-01 (UC001)
- **Given** tin "Java Developer" của công ty X có trên cả TopCV và ITviec, **When** tìm "java" lọc "Hà Nội", **Then** tin hiện **một lần**, ghi "có trên 2 trang".
- **Given** không có tin nào khớp, **When** tìm, **Then** báo không có kết quả và gợi ý bỏ bớt bộ lọc.
- **Given** dịch vụ tìm kiếm tắt, **When** tìm "java", **Then** vẫn có kết quả trong ≤ 5 giây.

### US-05 (UC011)
- **Given** tin có kỹ năng đã trích, **When** mở chi tiết, **Then** thấy danh sách kỹ năng, lương đã chuẩn hóa, link trang gốc.
- **Given** tôi là thành viên có Java trong hồ sơ, **When** mở tin yêu cầu Java và Docker, **Then** Java được đánh dấu "đã có", Docker "còn thiếu".
- **Given** công ty có < 10 câu review mỗi khía cạnh, **Then** hiện "Chưa đủ dữ liệu đánh giá".

### US-02 (UC004)
- **Given** tôi dán đoạn có "Java, Spring Boot và MySQL", **When** bấm "Trích kỹ năng", **Then** đề xuất gồm Java, Spring Boot, MySQL, mỗi mục bỏ chọn được.
- **Given** tôi đã lưu hồ sơ, **When** xem lại, **Then** không thấy văn bản CV gốc, chỉ thấy kỹ năng đã lưu.
- **Given** dịch vụ khai phá tắt, **When** bấm "Trích kỹ năng", **Then** vẫn có kết quả bằng từ điển, ghi "chế độ đơn giản".

### US-03 (UC012)
- **Given** hồ sơ có Java, SQL, **When** mở trang Gợi ý, **Then** thấy tối đa 10 tin đang mở, mỗi tin ghi kỹ năng khớp và kỹ năng thiếu.
- **Given** hồ sơ rỗng, **When** mở trang Gợi ý, **Then** được dẫn tới trang lập hồ sơ.
- **Given** dịch vụ khai phá tắt, **Then** vẫn có gợi ý xếp theo số kỹ năng trùng.

### US-04 (UC005)
- **Given** công ty có ≥ 10 câu về "lương thưởng và phúc lợi", **When** mở trang công ty, **Then** thấy tỉ lệ tích cực/tiêu cực và câu ví dụ.
- **Given** khía cạnh có < 10 câu, **Then** hiển thị "Chưa đủ dữ liệu".

### US-06 (UC010)
- **Given** email chưa đăng ký, **When** đăng ký với mật khẩu 8 ký tự, **Then** tài khoản được tạo và tôi được chuyển tới trang Hồ sơ kỹ năng.
- **Given** email đã đăng ký, **When** đăng ký lại, **Then** báo "Email đã được đăng ký".
- **Given** sai mật khẩu, **When** đăng nhập, **Then** báo chung "Email hoặc mật khẩu không đúng".

### US-07 (UC002)
- **Given** có dữ liệu 6 tháng, **When** mở trang Xu hướng, **Then** thấy top 20 kỹ năng tháng gần nhất kèm % thay đổi.

### US-08 (UC013)
- **Given** hồ sơ có Java, SQL và nhiều tin yêu cầu Java, SQL, Spring Boot, **When** bấm "Nên học thêm gì?", **Then** Spring Boot nằm trong top 5 kèm số tin khớp thêm.

### US-09 (UC006)
- **Given** tôi bật cảnh báo cho hồ sơ có Java, **When** một tin Java mới vào hệ thống, **Then** trong ≤ 5 phút có thông báo chưa đọc.
- **Given** đã có thông báo cho một nhóm tin trùng, **When** bản đăng lại của tin đó xuất hiện, **Then** không có thông báo thứ hai.

### US-10 (UC009)
- **Given** nguồn ITviec chưa crawl 30 giờ, **When** quản trị mở trang, **Then** dòng ITviec tô đỏ.
- **Given** tôi không phải admin, **When** gọi trang, **Then** nhận 403.
