cask "ultraxreal" do
  version "1.0.0"
  sha256 "af5e4b21c4141f519050d8f37aa552d0e020a8f80b2c7ec3734b25d2f1a2f641"

  url "https://github.com/DannyDesert/XReal-Ultrawide/releases/download/v#{version}/UltraXReal-v#{version}.dmg"
  name "UltraXReal"
  desc "Virtual ultrawide display for XReal Air AR glasses"
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
  EOS

  zap trash: [
    "~/Library/Preferences/com.ultraxreal.app.plist",
  ]
end
