# UC012 Nhận gợi ý việc làm – US-03
Feature: Nhận gợi ý việc làm

  Scenario: Gợi ý kèm lý do
    Given thành viên đăng nhập có hồ sơ kỹ năng "Java", "SQL"
    And gold mẫu có ít nhất 10 tin đang mở yêu cầu "Java" hoặc "SQL"
    When thành viên mở trang Gợi ý
    Then thấy tối đa 10 tin đang mở
    And mỗi tin ghi kỹ năng khớp và kỹ năng còn thiếu

  Scenario: Chưa có hồ sơ
    Given thành viên đăng nhập chưa có hồ sơ kỹ năng
    When thành viên mở trang Gợi ý
    Then được dẫn tới trang Hồ sơ kỹ năng

  Scenario: Đường lùi khi dịch vụ khai phá tắt
    Given dịch vụ khai phá không chạy
    And thành viên có hồ sơ kỹ năng "Java", "SQL"
    When thành viên mở trang Gợi ý
    Then tin khớp cả "Java" và "SQL" đứng trước tin chỉ khớp một kỹ năng
    And màn hình ghi "chế độ đơn giản"
