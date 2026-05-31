class MobileRelease < Formula
  desc "Local-first mobile release CLI for iOS and Android"
  homepage "https://github.com/MarlonJD/mobile-release-tools"
  url "https://github.com/MarlonJD/mobile-release-tools/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "5ea5be32b489844dd40bf65349a4db8e966497df09067d492161b62cad94166c"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"mobile-release", "./cmd/mobile-release"
  end

  test do
    assert_match "mobile-release manages mobile release metadata", shell_output("#{bin}/mobile-release --help")
  end
end
