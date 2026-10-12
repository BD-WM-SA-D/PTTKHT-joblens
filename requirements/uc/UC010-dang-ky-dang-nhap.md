# UC010 – Đăng ký / đăng nhập

| | |
|---|---|
| **Actor chính** | Khách |
| **Mức** | P0 |
| **Mô tả** | Khách tạo tài khoản bằng email + mật khẩu hoặc đăng nhập để dùng chức năng thành viên |
| **Tiền điều kiện** | Chưa đăng nhập |
| **Hậu điều kiện** | Có phiên đăng nhập hợp lệ (token) với vai trò `member` hoặc `admin` |

## Luồng chính – Đăng ký

1. Khách chọn "Đăng ký", nhập email và mật khẩu (nhập lại mật khẩu).
2. Hệ thống kiểm tra email đúng định dạng, chưa dùng; mật khẩu ≥ 8 ký tự.
3. Hệ thống băm mật khẩu, tạo tài khoản vai trò `member`.
4. Hệ thống đăng nhập luôn và chuyển tới trang Hồ sơ kỹ năng (UC004).

## Luồng chính – Đăng nhập

1. Khách nhập email và mật khẩu.
2. Hệ thống so khớp mật khẩu đã băm.
3. Hệ thống cấp token (hết hạn sau 24 giờ) và chuyển về trang trước đó.

## Luồng thay thế / ngoại lệ

- **2a (đăng ký). Email đã dùng:** báo "Email đã được đăng ký".
- **2b (đăng ký). Mật khẩu yếu:** báo yêu cầu.
- **2a (đăng nhập). Sai email hoặc mật khẩu:** báo chung "Email hoặc mật khẩu không đúng" (không tiết lộ cái nào sai).
- **2b (đăng nhập). Sai 5 lần trong 15 phút:** khóa đăng nhập tài khoản đó 15 phút.

## Quy tắc nghiệp vụ

- BR-12: Mật khẩu băm bằng argon2 hoặc bcrypt, không lưu dạng gốc.
- BR-13: Tài khoản `admin` chỉ tạo bằng lệnh quản trị, không đăng ký qua giao diện.

## Dữ liệu

`app.user_account`. API cổng: `POST /api/auth/register`, `POST /api/auth/login`.

## NFR liên quan

NFR-05.
