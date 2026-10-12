# UC010 Đăng ký / đăng nhập – US-06
Feature: Đăng ký và đăng nhập

  Scenario: Đăng ký thành công
    Given email "minh@example.com" chưa đăng ký
    When khách đăng ký với email "minh@example.com" và mật khẩu "matkhau123"
    Then tài khoản được tạo với vai trò "member"
    And khách được chuyển tới trang Hồ sơ kỹ năng

  Scenario: Email đã dùng
    Given email "minh@example.com" đã đăng ký
    When khách đăng ký lại với email "minh@example.com"
    Then hệ thống báo "Email đã được đăng ký"

  Scenario: Sai mật khẩu
    Given email "minh@example.com" đã đăng ký
    When khách đăng nhập với mật khẩu sai
    Then hệ thống báo "Email hoặc mật khẩu không đúng"

  Scenario: Mật khẩu không lưu dạng gốc
    Given khách đã đăng ký với mật khẩu "matkhau123"
    When kiểm tra bảng user_account
    Then không cột nào chứa "matkhau123"
