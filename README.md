# PTTKHT-joblens (joblens-app)

Cổng JobLens VN (API + UI) cho người tìm việc, nhà tuyển dụng/chuyên viên phân tích và quản trị dữ liệu, kèm toàn bộ tài liệu phân tích thiết kế theo khung báo cáo 7 chương.

> **Phạm vi đánh giá – môn Phân tích thiết kế hệ thống (IT3120, học kỳ 20261)**
>
> Dự án JobLens dùng chung hạ tầng dữ liệu với môn Big Data Storage and Processing và Web Mining (đã được giảng viên đồng ý ngày <dd/mm/yyyy>). Repo này chỉ chứa và đề nghị đánh giá các phần sau:
> - Mô hình nghiệp vụ, ca sử dụng, user story, yêu cầu phi chức năng.
> - UML, mẫu thiết kế, kiến trúc 4+1.
> - Cổng JobLens (API + UI) và các kịch bản kiểm thử chấp nhận.
>
> Các phần sau thuộc môn khác, nằm ở repo riêng và chỉ được nhắc tới để làm rõ bối cảnh:
> - Nền tảng dữ liệu (Kafka, Iceberg, dbt, Airflow, Trino, Kubernetes): môn Big Data.
> - Crawler và các mô hình khai phá: môn Web Mining.
>
> Số đo hiệu năng lấy từ môn Big Data chỉ được trích làm bằng chứng kiểm thử NFR, không phân tích lại.

## Thành viên phụ trách

| Thành viên | MSSV | Vai trò trong repo này |
|---|---|---|
| <Họ tên> | <MSSV> | <…> |

## Chạy nhanh (không cần các repo khác)

```bash
# 1. Cài hợp đồng dữ liệu (pin version)
pip install git+https://github.com/BD-WM-SA-D/joblens@v<x.y.z>

# 2. Cấu hình
cp .env.example .env

# 3. Chạy với gold mẫu (DuckDB/Parquet sinh từ fixtures) thay cho Trino
<lệnh chạy>
```

## Cấu trúc thư mục

```
api/                 JobLens API
web/                 JobLens Web UI
uml/                 nguồn PlantUML / draw.io: UC, ECB, sequence, state, package, deployment
requirements/        user story, đặc tả UC, NFR
tests/acceptance/    kịch bản Given/When/Then
docs/                nguồn báo cáo 7 chương
docs/adr/            ADR phía ứng dụng
```

## Tài liệu

- Báo cáo môn: [`docs/`](docs/)
- Quyết định kiến trúc: [`docs/adr/`](docs/adr/)
- Thuật ngữ: [`glossary.md` trong repo joblens](https://github.com/BD-WM-SA-D/joblens/blob/main/glossary.md)

## Phụ thuộc (chỉ để tham khảo, không thuộc phần chấm)

| Repo | Vai trò | Version đang dùng |
|---|---|---|
| [`joblens`](https://github.com/BD-WM-SA-D/joblens) (joblens-contracts) | Schema bảng gold, fixtures, glossary | v<x.y.z> |
| [`Big-Data-Storage-and-Processing-joblens`](https://github.com/BD-WM-SA-D/Big-Data-Storage-and-Processing-joblens) (joblens-platform) | Cung cấp các bảng gold qua Trino | v<x.y.z> |

## Chốt số liệu cho báo cáo

| Tag | Ngày | Iceberg tag / snapshot | Ghi chú |
|---|---|---|---|
| `report-sad-v1` | <dd/mm/yyyy> | <…> | <version platform + contracts dùng khi kiểm thử chấp nhận> |

## Dữ liệu và giấy phép

Repo không chứa dữ liệu crawl. Dữ liệu mẫu nằm trong fixtures của repo `joblens`. Nếu dùng VietJobs (Pham Dinh et al., LREC 2026) thì phải trích dẫn theo giấy phép của dataset.
