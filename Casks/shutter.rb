cask "shutter" do
  version "0.3.0"
  sha256 "c0ccc1c2fffe6d9c4d2c14f754c7dbb55f5c81397b27377861003a0763c70094"

  url "https://github.com/zahidhossin39/shutter/releases/download/v#{version}/Shutter_#{version}_universal.dmg"
  name "Shutter"
  desc "Screenshot tool with blur, OCR, annotations and a drag-out shelf"
  homepage "https://github.com/zahidhossin39/shutter"

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Shutter.app"

  # Not notarized yet: without this, macOS blocks the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Shutter.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.zaid-hossain.screenshot-app",
    "~/Library/Caches/com.zaid-hossain.screenshot-app",
    "~/Library/WebKit/com.zaid-hossain.screenshot-app",
  ]
end