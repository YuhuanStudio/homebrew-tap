cask "yunaudio" do
  version "0.1.5"
  sha256 "17785f9af492847cf4e2019f9b6a1e68f17866dfb83634d117f00e8ebf0be89a"

  url "https://github.com/YuhuanStudio/YunAudio/releases/download/v#{version}/YunAudio-#{version}-app.zip"
  name "YunAudio"
  desc "Audio router with a measurable, bit-exact signal path"
  homepage "https://github.com/YuhuanStudio/YunAudio"

  livecheck do
    url :url
    strategy :github_latest
  end

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
