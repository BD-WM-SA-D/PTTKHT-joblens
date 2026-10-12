# UC004 Lập hồ sơ kỹ năng – US-02
Feature: Lập hồ sơ kỹ năng từ CV

  Background:
    Given thành viên đã đăng nhập

  Scenario: Trích kỹ năng từ văn bản dán vào
    When thành viên dán "Em đã làm đồ án bằng Java, Spring Boot và MySQL" và bấm "Trích kỹ năng"
    Then danh sách đề xuất gồm "Java", "Spring Boot", "MySQL"
    And mỗi kỹ năng có thể bỏ chọn

  Scenario: Không lưu văn bản CV
    Given thành viên dán văn bản có chuỗi đánh dấu "MARKER-CV-123" và lưu hồ sơ
    When kiểm tra CSDL ứng dụng và log
    Then không tìm thấy chuỗi "MARKER-CV-123"
    And hồ sơ chỉ chứa danh sách kỹ năng đã chọn

  Scenario: Đường lùi khi dịch vụ khai phá tắt
    Given dịch vụ khai phá không chạy
    When thành viên dán "Thành thạo Python và Docker" và bấm "Trích kỹ năng"
    Then danh sách đề xuất gồm "Python", "Docker"
    And màn hình ghi "chế độ đơn giản"

  Scenario: Văn bản quá dài
    When thành viên dán văn bản dài 20001 ký tự
    Then hệ thống báo lỗi và không gửi yêu cầu trích
