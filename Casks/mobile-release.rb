cask "mobile-release" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.2"
  sha256 arm:   "c13e85e6888e0d06ef084f6ffce59db00ddc5b26a0ac059ebac681d3f19dc13c",
         intel: "5ce217f9700bdeb79d1d9b907ffb9468f073f297b40ebcb5a470fb732ee28256"

  url "https://github.com/MarlonJD/mobile-release-tools/releases/download/v#{version}/mobile-release_#{version}_darwin_#{arch}.tar.gz",
      verified: "github.com/MarlonJD/mobile-release-tools/"
  name "mobile-release"
  desc "Local-first mobile release CLI for iOS and Android"
  homepage "https://github.com/MarlonJD/mobile-release-tools"

  binary "mobile-release"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/mobile-release"]
  end
end
