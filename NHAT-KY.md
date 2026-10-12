# Nhật ký thay đổi – PTTKHT-joblens

Chỉ ghi sự kiện đáng nhớ: đổi hợp đồng hoặc file cấu hình chung, ghép hệ thống, chốt số liệu, quyết định quan trọng. Việc thường ngày đã có lịch sử git. Mục mới đặt trên cùng, vài dòng là đủ – xem [repo-routing](https://github.com/BD-WM-SA-D/joblens/blob/main/docs/repo-routing.md), mục Nhật ký.

## 2026-10-12 · Hoang Le

- Chốt phạm vi theo [Blueprint hệ thống](https://github.com/BD-WM-SA-D/joblens/blob/main/docs/project-plan/14-blueprint-he-thong.md) (đề xuất): persona sinh viên/fresher IT; UC thu hẹp (bỏ UC007, UC008; thêm UC011, UC012, UC013); gợi ý trực tuyến qua `mining-service` (ADR 0002 của joblens).
- Tạo: `requirements/` (persona, danh sách UC, 10 đặc tả UC, user story, NFR), `uml/` (10 sơ đồ PlantUML), `docs/adr/0001-cong-nghe-cong.md`, `docs/adr/0002-khong-luu-van-ban-cv.md`, `docs/ai-log.md`, `tests/acceptance/*.feature` (P0). Sửa `README.md`; `AGENTS.md` đồng bộ từ joblens (CSDL ứng dụng, `mining.v1`).
- Ảnh hưởng repo khác: dùng hợp đồng mới `schemas/api/mining.v1.yaml`, cột `gold.dim_skill.aliases`, `silver.review_aspects.sentence_text`, bảng `gold.data_status` (joblens, draft).
- AI: Claude Code (Claude Opus 5.5) – soạn toàn bộ nháp; <người kiểm tra> đã kiểm tra

## 2026-10-02 · Hoang Le · chưa có PR

- **Tạo:** –
- **Sửa:** `.env.example` (C – thêm biến đăng nhập S3/Trino, `JOBLENS_SEARCH_URL`, ADR 0001 D7); `AGENTS.md` (C – phạm vi repo theo ADR 0001); `.gitignore`, `.pre-commit-config.yaml` (C – chỉ đổi dòng chú thích đầu file)
- **Xóa:** –
- **Lý do:** đồng bộ file cấu hình chung sau khi repo `joblens` thêm hợp đồng dữ liệu và ADR 0001
- **Ảnh hưởng repo khác:** đồng bộ cùng lúc ở cả 4 repo – xem `joblens/NHAT-KY.md`
- **AI:** Claude Code (Claude Opus 5.5) – soạn schema, contract, script, sửa docs theo phương án đề xuất của ADR 0001; <người kiểm tra> đã kiểm tra

## 2026-10-02 · Hoang Le · chưa có PR

- **Tạo:** `AGENTS.md`, `CLAUDE.md`, `.cursor/rules/joblens.mdc` (C – đồng bộ từ joblens, có dòng `ĐỒNG BỘ TỪ`)
- **Sửa:** –
- **Xóa:** –
- **Lý do:** quy tắc làm việc cho AI agent (Codex, Claude Code, Cursor): tra repo-routing trước khi tạo file, ghi nhật ký, những việc không được làm, phạm vi riêng của repo này
- **Ảnh hưởng repo khác:** đồng bộ cùng lúc ở cả 4 repo – xem `joblens/NHAT-KY.md`
- **AI:** Claude Code (Claude Opus 5.5) – soạn quy tắc và script đồng bộ; <người kiểm tra> đã kiểm tra

## 2026-10-02 · Hoang Le · không qua PR (giai đoạn khởi tạo)

- **Tạo:** `NHAT-KY.md` (D)
- **Sửa:** `.gitignore`, `.pre-commit-config.yaml`, `.env.example`, `.gitattributes`, `CONTRIBUTING.md` (C – đồng bộ từ joblens, thêm dòng `ĐỒNG BỘ TỪ`; CONTRIBUTING thêm bước tra repo-routing và ghi nhật ký)
- **Xóa:** –
- **Lý do:** áp dụng quy ước file nào lên repo nào và nhật ký thay đổi
- **Ảnh hưởng repo khác:** đồng bộ cùng lúc ở cả 4 repo – xem `joblens/NHAT-KY.md`
- **AI:** Claude Code – dựng khung, soạn nội dung; <người kiểm tra> đã kiểm tra

## 2026-10-02 · Hoang Le · không qua PR (giai đoạn khởi tạo)

- **Tạo:** khung thư mục `api/`, `web/`, `uml/`, `requirements/`, `tests/acceptance/`, `docs/adr/` (B); `README.md` (D); file cấu hình chung (C)
- **Sửa:** –
- **Xóa:** –
- **Lý do:** khởi tạo repo theo docs/project-plan/08 (repo GitHub `PTTKHT-joblens` tạo trống)
- **Ảnh hưởng repo khác:** không
- **AI:** Claude Code – dựng khung, soạn nội dung; <người kiểm tra> đã kiểm tra
