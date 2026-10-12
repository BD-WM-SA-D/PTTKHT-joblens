# UC005 Xem đánh giá công ty theo khía cạnh – US-04
Feature: Xem đánh giá công ty theo khía cạnh

  Scenario: Khía cạnh đủ dữ liệu
    Given công ty "X" có 12 câu review về "lương thưởng và phúc lợi"
    When khách mở trang công ty "X"
    Then thấy tỉ lệ tích cực và tiêu cực của "lương thưởng và phúc lợi"
    And thấy câu ví dụ không kèm tên người viết

  Scenario: Khía cạnh thiếu dữ liệu
    Given công ty "X" có 4 câu review về "văn phòng làm việc"
    When khách mở trang công ty "X"
    Then khía cạnh "văn phòng làm việc" hiển thị "Chưa đủ dữ liệu"
