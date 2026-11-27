cask "skyshot" do
  version "1.0.8"
  sha256 "84db5572bec3aad1a007d9c765ae65c1e399527801ffe5b7937710629a103dab"

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
