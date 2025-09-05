class Rectiq < Formula
  desc "Rectiq CLI — secure, privacy-first API client"
  homepage "https://rectiq.dev"
  version "0.1.0" # auto-updated by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0b21ba222485534f5656097010b5f6e733ade3087dd1e2f21022b6446f2a5728"
    else
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "deb92917a22576ba14793d1d0f1add2b4a9a60c0ef8278a885c771fa770254c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e374b545fe7e7915590f611daee3609c6405a89ab0809cd27cf015df4d5a0e3"
    else
      url "https://github.com/purlity/rectiq/releases/download/rectiq-cli-v#{version}/rectiq-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea8d522bd6c432b38f3ed81e4ad715481e068041e0dff22c4231b16922423ec8"
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
