# Yêu cầu phi chức năng

Mỗi NFR phát biểu đo được (l03: unambiguous, measurable) và có cách kiểm thử ở chương 6. Số đo của BD chỉ được **trích** kèm tag `report-bd-v1`, không phân tích lại (R4).

| ID | Nhóm | Phát biểu | Kiểm thử | Bằng chứng |
|---|---|---|---|---|
| NFR-01 | Hiệu năng | 95% yêu cầu tới API cổng của UC001, UC002, UC005, UC011 trả về ≤ 3 giây với 20 người dùng đồng thời | Script tải (locust hoặc k6), 10 phút | Báo cáo tải của nhóm SA&D |
| NFR-02 | Hiệu năng | 95% yêu cầu trích kỹ năng (văn bản ≤ 3.000 ký tự) trả về ≤ 3 giây khi `mining-service` chạy trên CPU | Script tải gọi `POST /api/profile/skills/extract` | Báo cáo tải |
| NFR-03 | Chịu lỗi | Khi `mining-service` hoặc `search-service` tắt/lỗi, UC001, UC004, UC012 vẫn trả kết quả bằng đường lùi trong ≤ 5 giây | Tắt dịch vụ rồi chạy kịch bản chấp nhận | Kết quả kịch bản |
| NFR-04 | Độ tươi | Tin mới hiện trong UC001 ≤ 24 giờ sau khi crawl; thông báo UC006 ≤ 5 phút sau khi tin vào Kafka | So `crawl_ts` với thời điểm hiển thị | Trích số đo BD |
| NFR-05 | Riêng tư, bảo mật | Không lưu/không ghi log văn bản CV; mật khẩu băm argon2/bcrypt; API thành viên yêu cầu token; không có cột PII ở silver/gold | Test tự động (quét log, quét bảng `app`), review code | Kết quả test |
| NFR-06 | Khả năng dùng | 4/5 người dùng mới hoàn thành "dán CV → xem gợi ý" ≤ 3 phút không cần hướng dẫn | Thử với 5 sinh viên, bấm giờ | Biên bản thử |
| NFR-07 | Chạy độc lập | Cổng chạy đủ P0 với gold mẫu (DuckDB/Parquet từ fixtures), không cần Trino, Kafka, dịch vụ khai phá | CI chạy kịch bản chấp nhận ở chế độ local | Log CI |
| NFR-08 | Triển khai | Dựng lại cổng từ repo bằng `docker compose up` ≤ 10 phút trên máy sạch; toàn hệ thống (cùng BD) ≤ 30 phút | Chạy thử trên máy sạch | Biên bản |
| NFR-09 | Tương thích | Giao diện dùng được trên Chrome/Edge bản mới và màn hình điện thoại rộng 360 px | Kiểm thử thủ công theo danh sách màn hình | Ảnh chụp |
