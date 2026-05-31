class MobileRelease < Formula
  desc "Local-first mobile release CLI for iOS and Android"
  homepage "https://github.com/MarlonJD/mobile-release-tools"
  url "https://github.com/MarlonJD/mobile-release-tools/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "d18d9631177cd499cd6fc02cbd846e1f4aab83415fbca921d339aa00c7793bac"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"mobile-release", "./cmd/mobile-release"
  end

  test do
    assert_match "mobile-release manages mobile release metadata", shell_output("#{bin}/mobile-release --help")
  end
end
