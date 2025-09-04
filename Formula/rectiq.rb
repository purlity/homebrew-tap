class Rectiq < Formula
  desc "Rectiq CLI — secure, privacy-first API client"
  homepage "https://rectiq.dev"
  version "0.1.0" # auto-updated by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-v#{version}-aarch64-apple-darwin.tar.xz"
      sha256 "__SHA256_MAC_ARM64__"
    else
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-v#{version}-x86_64-apple-darwin.tar.xz"
      sha256 "__SHA256_MAC_X64__"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-v#{version}-aarch64-unknown-linux-musl.tar.xz"
      sha256 "__SHA256_LINUX_ARM64__"
    else
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-v#{version}-x86_64-unknown-linux-musl.tar.xz"
      sha256 "__SHA256_LINUX_X64__"
    end
  end

  def install
    bin.install "rectiq" if File.exist?("rectiq")
    bin.install "bin/rectiq" if File.exist?("bin/rectiq")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rectiq --version")
  end
end
