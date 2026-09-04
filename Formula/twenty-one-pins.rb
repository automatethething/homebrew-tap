class TwentyOnePins < Formula
  desc "Local-first LLM key custody, policy, and routing gateway"
  homepage "https://21pins.com"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/automatethething/21pins/releases/download/v0.1.1/21pins_0.1.1_darwin_arm64.tar.gz"
      sha256 "475430497e2a22f2322ea84b9c457a62bc98d75a6d3e6d9b626cbf7c03577692"
    else
      url "https://github.com/automatethething/21pins/releases/download/v0.1.1/21pins_0.1.1_darwin_amd64.tar.gz"
      sha256 "6a85e8f3ca1bbf0c5aa87bb4f327e4033e19c710f3e4e1cb7cfbce9f7de71fec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/automatethething/21pins/releases/download/v0.1.1/21pins_0.1.1_linux_arm64.tar.gz"
      sha256 "27139a5279ff1e151c0f8ca3f0fce739c02bcd6fb4e857173ddbd66244998fd3"
    else
      url "https://github.com/automatethething/21pins/releases/download/v0.1.1/21pins_0.1.1_linux_amd64.tar.gz"
      sha256 "c007626ebe59179a35ef16833ad7e4e815775dc1bbf61b910908cfeff811a742"
    end
  end

  def install
    bin.install "21pins"
  end

  test do
    ENV["PINS21_STATE_PATH"] = testpath/"state.json"
    system "#{bin}/21pins", "init"
  end
end
