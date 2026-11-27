cask "skyshot" do
  version "0.4.1"
  sha256 "20ef14218032939062b738e69ff0c3f989ce330bba6dd422ca611ef2d7334fab"

  url "https://github.com/zahidhossin39/SkyShot/releases/download/v#{version}/Sky.Shot_#{version}_universal.dmg"
  name "Sky Shot"
  desc "Screenshot tool with blur, OCR, annotations and a drag-out shelf"
  homepage "https://github.com/zahidhossin39/SkyShot"

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Sky Shot.app"

  # Not notarized yet: without this, macOS blocks the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Sky Shot.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.zaid-hossain.screenshot-app",
    "~/Library/Caches/com.zaid-hossain.screenshot-app",
    "~/Library/WebKit/com.zaid-hossain.screenshot-app",
  ]
end