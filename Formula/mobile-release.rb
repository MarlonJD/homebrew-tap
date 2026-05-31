class MobileRelease < Formula
  desc "Local-first mobile release CLI for iOS and Android"
  homepage "https://github.com/MarlonJD/mobile-release-tools"
  url "https://github.com/MarlonJD/mobile-release-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "52c7b832f2adf5b2039371cfa2922a3bf14e66ab194c479f072f5f727f7bbb1e"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"mobile-release", "./cmd/mobile-release"
  end

  test do
    assert_match "mobile-release manages mobile release metadata", shell_output("#{bin}/mobile-release --help")
  end
end
