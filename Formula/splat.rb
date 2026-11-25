class Splat < Formula
  desc "Local-first asset pipeline for Apple Silicon: images, depth, splats and meshes"
  homepage "https://github.com/daanrongen/splat"
  # url, version and sha256 are updated by .github/workflows/update.yml
  url "https://github.com/daanrongen/splat/releases/download/v0.1.14/splat-0.1.14-macos-arm64.tar.gz"
  version "0.1.14"
  sha256 "0aae2c324ec434c46ca592540cf3c8535e1c233d387b258fcc791f26bf048c6b"
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
