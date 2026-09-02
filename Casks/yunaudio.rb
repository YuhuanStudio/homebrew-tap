cask "yunaudio" do
  version "0.1.6"
  sha256 "646742a86f80fd04800a779d38bd58f1d0b7a93c17af1b6ab69bf94c35fed489"

  url "https://github.com/YuhuanStudio/YunAudio/releases/download/v#{version}/YunAudio-#{version}-app.zip"
  name "YunAudio"
  desc "Audio router with a measurable, bit-exact signal path"
  homepage "https://github.com/YuhuanStudio/YunAudio"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on macos: :sonoma

  app "YunAudio.app"

  caveats <<~EOS
    YunAudio is currently signed ad-hoc. On first launch, macOS may require
    approval under System Settings → Privacy & Security → Open Anyway.

    The optional YunAudio virtual audio device is installed from YunAudio's
    About settings. That explicit action asks for an administrator password and
    briefly restarts system audio; the cask itself does neither.
  EOS

  # No zap stanza: recordings, downloaded words and user-authored scripts are
  # data, not installation debris, and must never be inferred as safe to erase.
end
