class Splat < Formula
  desc "Local-first asset pipeline for Apple Silicon: images, depth, splats and meshes"
  homepage "https://github.com/daanrongen/splat"
  # url, version and sha256 are updated by .github/workflows/update.yml
  url "https://github.com/daanrongen/splat/releases/download/v0.1.11/splat-0.1.11-macos-arm64.tar.gz"
  version "0.1.11"
  sha256 "e08a19e4f65ac660c88df5fcea89a3b873ad9cf29095ebb069d748f3b0692295"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # keeps torch's @rpath dylib ids, which torchvision's extension resolves against
  preserve_rpath

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/splat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splat --version")
    system bin/"splat", "doctor"
  end
end
