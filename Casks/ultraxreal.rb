cask "ultraxreal" do
  version "1.0.0"
  sha256 "145de8f20d7da5c10b9970841114daaa6a8e0dc795779330c58a304eef484b32"

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
