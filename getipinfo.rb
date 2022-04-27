class Getipinfo < Formula
  desc "Get ip address with Golang on your computer/system"
  homepage "https://github.com/masum0813/getipinfo/"
  url "https://github.com/masum0813/getipinfo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a87146b8c597c5e7c2590de7d2c1b7d8843a642832dbc924484b3b4451d3763"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    bin.install 'getipinfo'
    bin.install Dir["lib"]
    bin.install Dir["files"]
    prefix.install "README.md"
    prefix.install "LICENSE"

  end

  test do
    output = shell_output(bin/"getipinfo version")
    assert output.include? "getipinfo version 0.0.10"
  end
end
