# Sơ đồ UML

Nguồn PlantUML (`.puml`) là bản gốc; ảnh PNG/SVG xuất khi cần cho báo cáo. Ký pháp UML của môn SA&D (R5) – không dán sơ đồ Helm hay luồng dữ liệu của BD.

| File | Loại | Dùng ở chương |
|---|---|---|
| `use-case.puml` | Biểu đồ ca sử dụng (có gói, include/extend) | 3 |
| `domain-model.puml` | Mô hình miền | 2–3 |
| `package.puml` | Biểu đồ gói của API cổng | 4 |
| `ecb-uc004-uc012.puml` | Lớp phân tích ECB cho UC004, UC012 (Strategy, Adapter) | 4 |
| `seq-uc004-uc012.puml` | Trình tự dán CV → gợi ý, có đường lùi | 4 |
| `seq-uc001.puml` | Trình tự tìm kiếm, có đường lùi | 4 |
| `seq-uc006.puml` | Trình tự cảnh báo bất đồng bộ (pub-sub) | 4 |
| `state-tin-tuyen-dung.puml` | Máy trạng thái TinTuyenDung | 4 |
| `state-dang-ky-canh-bao.puml` | Máy trạng thái DangKyCanhBao | 4 |
| `deployment.puml` | Biểu đồ triển khai (K8s + chế độ local) | 4–5 |

Còn thiếu: ECB và trình tự cho UC001, UC011, UC005, UC010 (P0) và các UC P1.

## Xem / xuất ảnh

- VS Code: cài extension *PlantUML* (jebbs.plantuml), mở file, `Alt+D` để xem.
- Dòng lệnh (cần Java): `java -jar plantuml.jar -charset UTF-8 -tpng uml/*.puml` (tải `plantuml.jar` từ plantuml.com, không commit).
