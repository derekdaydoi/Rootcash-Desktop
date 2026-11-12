# Rootcash Desktop

Khung thu – chi – trả nợ cho máy tính: nhập khung một lần, xem **free float** từng tháng và biết ngày nào dòng tiền xuống thấp.

```
FREE FLOAT = Thu − Sinh hoạt − Trả nợ
```

## Tải về

**[⬇ Tải Rootcash-Desktop.zip](https://github.com/derekdaydoi/Rootcash-Desktop/releases/latest/download/Rootcash-Desktop.zip)** (Windows, khoảng 80 KB)

1. Giải nén, giữ nguyên các file cạnh nhau.
2. Nhấp đúp `Rootcash.exe`.
3. Nếu máy chặn file exe (phần mềm diệt virus thường chặn exe chưa ký), nhấp đúp `Rootcash.cmd` — kết quả giống hệt.

Máy cần có Microsoft Edge hoặc Google Chrome. Không cần cài đặt gì thêm.

Không dùng Windows? Tải riêng [`rootcash.html`](rootcash.html) rồi mở bằng trình duyệt.

## Local only

- **Không có máy chủ, không tài khoản, không đồng bộ.** App không gửi số liệu của bạn đi đâu cả.
- **Dữ liệu chỉ nằm trên máy bạn**, trong hồ sơ riêng của Rootcash (`%LOCALAPPDATA%\Rootcash`), tách khỏi trình duyệt thường.
- **Sao lưu là việc của bạn:** bấm **Xuất file** để lưu ra một file JSON, **Nhập file** để nạp lại hoặc chuyển sang máy khác.
- Thứ duy nhất tải từ mạng là font chữ (Google Fonts). Không có mạng, app dùng font của Windows và vẫn chạy đủ.

## App làm gì

- **Thu:** các object thu, mỗi object có ngày và số tiền, tuỳ chọn thời hạn áp dụng.
- **Sinh hoạt:** một con số khung mỗi tháng; chia mục chi tiết là tuỳ chọn, để áng chừng.
- **Khoản vay:** tự sinh lịch trả theo đúng ngày.
  - Trả gốc: đều mỗi kỳ, một lần cuối kỳ, hoặc góp đều.
  - Tính lãi: không lãi, phẳng, dư nợ giảm dần, hoặc số tiền cố định.
  - Trả lãi: mỗi kỳ, một lần lúc vay, hoặc một lần cuối kỳ.
- **Thanh khoản M/x:** tiền phải trả mỗi tháng trên mỗi đồng gốc vay, tức `1/kỳ hạn + lãi`. Ví dụ vay 12 kỳ, lãi phẳng 1,5%/tháng: `1/12 + 1,5% = 9,83%` gốc mỗi tháng.
- **6 / 12 / 24 tháng tới:** free float từng tháng; chọn giữ làm buffer (dồn sang tháng sau) hoặc đem đầu tư.
- **Trong tháng:** số dư cuối mỗi ngày, ngày thấp nhất, ngày âm.

Mỗi kỳ vay tính là một tháng; lãi năm chia 12.

## Mã nguồn

| File | Vai trò |
| --- | --- |
| `rootcash.html` | Toàn bộ app: giao diện và phần tính toán. HTML/CSS/JS thuần, không framework, không bước build. |
| `Rootcash.cs` | Trình mở: mở `rootcash.html` trong một cửa sổ riêng. |
| `Rootcash.cmd` | Trình mở dự phòng, làm đúng việc đó mà không cần exe. `Rootcash.cmd shortcut` tạo lối tắt trên Desktop. |
| `build.cmd` | Tạo `Rootcash.exe` bằng trình biên dịch có sẵn trong Windows. |

Bản cho iPhone: [Rootcash webapp](https://github.com/derekdaydoi/Rootcash). Rootcash Desktop nhập được file sao lưu của bản đó.

---

© Copyright from derekdaydoi
