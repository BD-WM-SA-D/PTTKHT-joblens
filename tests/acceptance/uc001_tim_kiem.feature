# UC001 Tìm kiếm việc làm – US-01. Dữ liệu: gold mẫu sinh từ fixtures (scripts/make_sample_gold.py)
Feature: Tìm kiếm việc làm

  Background:
    Given gold mẫu có tin "Java Developer" của công ty "X" trên cả "topcv" và "itviec" cùng một dup_group_id
    And tin đó làm việc tại "Hà Nội" và đang mở

  Scenario: Tin trùng giữa các trang chỉ hiện một lần
    When khách tìm "java" với bộ lọc địa điểm "Hà Nội"
    Then kết quả có đúng 1 tin "Java Developer" của công ty "X"
    And tin đó ghi "có trên 2 trang"

  Scenario: Không có kết quả
    When khách tìm "cobol" với bộ lọc địa điểm "Hà Nội"
    Then hệ thống báo không tìm thấy và gợi ý bỏ bớt bộ lọc

  Scenario: Đường lùi khi dịch vụ tìm kiếm tắt
    Given dịch vụ tìm kiếm không chạy
    When khách tìm "java"
    Then vẫn có kết quả trong không quá 5 giây

  Scenario: Từ khóa không hợp lệ
    When khách tìm chuỗi rỗng
    Then hệ thống báo lỗi tại ô tìm kiếm và không gửi truy vấn
