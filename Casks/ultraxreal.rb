cask "ultraxreal" do
  version "2.0.0"
  sha256 "a90f2c56c34355548caa619813e60cb1d8efa84a5a9d450dad560f7eea726555"

  url "https://github.com/DannyDesert/XReal-Ultrawide/releases/download/v#{version}/UltraXReal-v#{version}.dmg"
  name "UltraXReal"
  desc "Spatial floating display and ultrawide HUD for XReal Air AR glasses"
  homepage "https://github.com/DannyDesert/XReal-Ultrawide"

  depends_on macos: ">= :ventura"

  app "UltraXReal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/UltraXReal.app"]
  end

  caveats <<~EOS
    UltraXReal uses a private Apple API and is not notarized.

    If macOS blocks it on first launch:
      1. Open System Settings > Privacy & Security
      2. Scroll down and click "Open Anyway" next to UltraXReal
      3. Or run: xattr -cr /Applications/UltraXReal.app

    After allowing it once, it will launch normally every time.

    Spatial mode requires screen recording permission (macOS will prompt).
    Connect XReal Air via USB-C before enabling spatial mode.
  EOS

  zap trash: [
    "~/Library/Preferences/com.ultraxreal.app.plist",
  ]
end
