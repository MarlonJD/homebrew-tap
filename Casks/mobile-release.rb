cask "mobile-release" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.1"
  sha256 arm:   "00dc776f5b174b2785f73f2e9dbfcb7de8c836a337bce82e4534e29066f0ccdc",
         intel: "792a7521bf518f0cb494d3165bccc91c9592f415256831fcd8c06a2244fb9788"

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
