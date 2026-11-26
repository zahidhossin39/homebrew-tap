cask "sky-shot" do
  version "0.4.0"
  sha256 "e683a3b05c06bd5d3cfe59eaedfc3ab6f535971a2a0584053474715ba5177ea9"

  url "https://github.com/zahidhossin39/sky-shot/releases/download/v#{version}/Sky.Shot_#{version}_universal.dmg"
  name "Sky Shot"
  desc "Screenshot tool with blur, OCR, annotations and a drag-out shelf"
  homepage "https://github.com/zahidhossin39/sky-shot"

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