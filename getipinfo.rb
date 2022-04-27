# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Getipinfo < Formula
  desc "Get ip address with Golang on your computer/system "
  homepage "https://github.com/masum0813/getipinfo/"
  url "https://github.com/masum0813/getipinfo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a87146b8c597c5e7c2590de7d2c1b7d8843a642832dbc924484b3b4451d3763"
  license "MIT"

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", *std_go_args(ldflags: "-s -w")

    bin.install 'getipinfo'
    bin.install Dir["lib"]
    bin.install Dir["files"]
    prefix.install "README.md"
    prefix.install "LICENSE"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test getipinfo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    output = shell_output(bin/"getipinfo version")
    assert output.include? "getipinfo version 0.0.10"
  end
end
