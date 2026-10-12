# UC011 Xem chi tiết tin tuyển dụng – US-05
Feature: Xem chi tiết tin tuyển dụng

  Scenario: Hiển thị đầy đủ thông tin tin
    Given gold mẫu có tin "Java Developer" yêu cầu kỹ năng "Java" và "Docker"
    When khách mở chi tiết tin đó
    Then thấy danh sách kỹ năng "Java", "Docker"
    And thấy lương đã chuẩn hóa và link tới trang gốc

  Scenario: Đánh dấu kỹ năng khớp hồ sơ
    Given thành viên đăng nhập có hồ sơ kỹ năng "Java"
    When mở chi tiết tin yêu cầu "Java" và "Docker"
    Then "Java" được đánh dấu "đã có"
    And "Docker" được đánh dấu "còn thiếu"

  Scenario: Công ty chưa đủ review
    Given công ty của tin có ít hơn 10 câu review ở mọi khía cạnh
    When khách mở chi tiết tin
    Then thấy "Chưa đủ dữ liệu đánh giá"

  Scenario: Tin không tồn tại
    When khách mở chi tiết một job_uid không có
    Then nhận trang 404 "Không tìm thấy tin"
