class CocoapodsAT175 < Formula
  desc "Dependency manager for Cocoa projects"
  homepage "https://cocoapods.org/"
  url "https://github.com/CocoaPods/CocoaPods/archive/1.7.5.tar.gz"
  sha256 "508e5f7a7566b3d05ec4e27417dc0a60bedc8e72618b31cb56713034e71337b9"

  bottle do
    cellar :any_skip_relocation
    sha256 "d3a1e25ecbb970fb8c560eb382d2ad638e91e3904079ab5927ad949fbdfcdd4c" => :catalina
    sha256 "d43db56c6e712b2ea5349d1fd02cb60678d7becc2672921132408498aa20adc2" => :mojave
    sha256 "29ed00f2a077cb02c4bc224738c2a6e1447cbe0b78112db3bc68f583d466506f" => :high_sierra
  end

  depends_on "ruby" if MacOS.version <= :sierra

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "cocoapods.gemspec"
    system "gem", "install", "cocoapods-#{version}.gem"
    # Other executables don't work currently.
    bin.install libexec/"bin/pod", libexec/"bin/xcodeproj"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/pod", "list"
  end
end
