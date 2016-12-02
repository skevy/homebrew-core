class Trace2html < Formula
  desc "Utility from Google Trace Viewer to convert JSON traces to HTML"
  homepage "https://github.com/catapult-project/catapult/tree/master/tracing"
  url "https://github.com/catapult-project/catapult/archive/9dae3963cdd72211f17a2c976dd077d1125cdde7.zip"
  sha256 "82c7495ad6c3951fbf808f902936f354cf847dcce22e5ca6ae529a5014909dca"

  bottle :unneeded

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"tracing/bin/trace2html"
  end

  test do
    touch "test.json"
    system "#{bin}/trace2html", "test.json"
    assert File.exist?("test.html")
  end
end
