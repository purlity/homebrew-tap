class Rectiqctl < Formula
  desc "Rectiq CLI — secure, privacy-first API client"
  homepage "https://rectiq.dev"
  version "0.1.0" # auto-updated by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/v#{version}/rectiqctl-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/purlity/rectiq/releases/download/v#{version}/rectiqctl-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/v#{version}/rectiqctl-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/purlity/rectiq/releases/download/v#{version}/rectiqctl-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "rectiqctl" if File.exist?("rectiqctl")
    bin.install "rectiq" if File.exist?("rectiq")
    bin.install "bin/rectiqctl" if File.exist?("bin/rectiqctl")
    bin.install "bin/rectiq" if File.exist?("bin/rectiq")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rectiqctl --version")
  end
end

