# UC004 – Lập hồ sơ kỹ năng

| | |
|---|---|
| **Actor chính** | Thành viên |
| **Actor phụ** | Dịch vụ khai phá (`mining-service`), Nền tảng dữ liệu (Trino – đường lùi) |
| **Mức** | P0 |
| **Mô tả** | Thành viên dán CV hoặc đoạn mô tả bản thân; hệ thống tự trích kỹ năng; thành viên sửa rồi lưu thành hồ sơ |
| **Quan hệ** | «include» Trích kỹ năng từ văn bản |
| **Tiền điều kiện** | Đã đăng nhập (UC010) |
| **Hậu điều kiện** | Hồ sơ kỹ năng được lưu; văn bản gốc không được lưu ở đâu |
| **User story** | US-02 |

## Luồng chính

1. Thành viên mở trang Hồ sơ kỹ năng.
2. Thành viên dán văn bản (≤ 20.000 ký tự) và bấm "Trích kỹ năng".
3. Hệ thống gửi văn bản tới dịch vụ khai phá (`POST /v1/skills:extract`).
4. Hệ thống hiển thị danh sách kỹ năng đề xuất, mỗi mục có ô chọn (mặc định chọn) và đoạn chữ gốc.
5. Thành viên bỏ chọn kỹ năng sai, thêm tay kỹ năng còn thiếu (ô gõ có gợi ý từ danh mục kỹ năng).
6. Thành viên bấm "Lưu".
7. Hệ thống lưu danh sách kỹ năng (đánh dấu nguồn `extracted` hoặc `manual`), xóa văn bản khỏi bộ nhớ, báo lưu thành công và mời xem gợi ý (→ UC012).

## Luồng thay thế

- **3a. Dịch vụ khai phá không có/lỗi/quá 3 giây:** hệ thống trích bằng từ điển (`gold.dim_skill.label` và `aliases`), hiển thị nhãn "chế độ đơn giản", tiếp tục bước 4.
- **2a. Thành viên không dán văn bản mà nhập tay:** bỏ qua bước 3–4, đi thẳng bước 5.
- **4a. Không tìm thấy kỹ năng nào:** báo "Không tìm thấy kỹ năng, hãy nhập tay", đi bước 5.
- **1a. Thành viên đã có hồ sơ:** hiển thị hồ sơ hiện tại; kỹ năng trích mới được gộp thêm, không xóa kỹ năng cũ trừ khi thành viên bỏ chọn.

## Ngoại lệ

- **2b. Văn bản rỗng hoặc > 20.000 ký tự:** báo lỗi, không gửi.
- **7a. Lưu thất bại (CSDL lỗi):** báo lỗi, giữ danh sách trên màn hình để thử lại.

## Quy tắc nghiệp vụ

- BR-06: Không lưu, không ghi log văn bản CV (ADR-app 0002). Màn hình ghi rõ điều này cạnh ô dán.
- BR-07: Kỹ năng trong hồ sơ phải có trong danh mục `gold.dim_skill` (theo `skill_id`).
- BR-08: Hồ sơ tối đa 50 kỹ năng.

## Dữ liệu

Gọi `POST /v1/skills:extract` (`joblens/schemas/api/mining.v1.yaml`); đường lùi đọc `gold.dim_skill`; ghi `app.skill_profile`, `app.profile_skill`. API cổng: `POST /api/profile/skills/extract`, `GET/PUT /api/profile/skills`.

## NFR liên quan

NFR-02 (trích ≤ 3 giây), NFR-03 (đường lùi), NFR-05 (riêng tư), NFR-06 (khả năng dùng ≤ 3 phút).
