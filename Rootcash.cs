// Rootcash.exe — mở rootcash.html (nằm cạnh file exe) trong một cửa sổ riêng, không thanh địa chỉ, không tab.
// Cửa sổ dùng Edge/Chrome có sẵn trên máy với hồ sơ riêng của Rootcash, nên dữ liệu không lẫn với trình duyệt thường.
// Build: chạy build.cmd (dùng csc.exe có sẵn trong Windows, không cần cài thêm gì).
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Windows.Forms;

static class Rootcash
{
    [STAThread]
    static void Main()
    {
        string page = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "rootcash.html");
        if (!File.Exists(page)) { Fail("Không thấy rootcash.html cạnh Rootcash.exe."); return; }

        var roots = new[] { Environment.GetEnvironmentVariable("ProgramFiles(x86)"), Environment.GetEnvironmentVariable("ProgramFiles"), Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) };
        var apps = new[] { @"Microsoft\Edge\Application\msedge.exe", @"Google\Chrome\Application\chrome.exe" };
        string browser = (from a in apps from r in roots where r != null let p = Path.Combine(r, a) where File.Exists(p) select p).FirstOrDefault();
        if (browser == null) { Fail("Cần Microsoft Edge hoặc Google Chrome để hiển thị Rootcash."); return; }

        string profile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Rootcash", "window");
        string args = "--app=\"" + new Uri(page).AbsoluteUri + "\" --user-data-dir=\"" + profile + "\" --no-first-run --no-default-browser-check --window-size=1440,920";
        try { Process.Start(new ProcessStartInfo(browser, args) { UseShellExecute = false }); }
        catch (Exception e) { Fail(e.Message); }
    }

    static void Fail(string message) { MessageBox.Show(message, "Rootcash", MessageBoxButtons.OK, MessageBoxIcon.Error); }
}
