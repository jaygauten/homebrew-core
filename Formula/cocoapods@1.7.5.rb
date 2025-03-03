class CocoapodsAT175 < Formula
  desc "Dependency manager for Cocoa projects"
  homepage "https://cocoapods.org/"
  url "https://github.com/CocoaPods/CocoaPods/archive/1.7.5.tar.gz"
  sha256 "508e5f7a7566b3d05ec4e27417dc0a60bedc8e72618b31cb56713034e71337b9"

  bottle do
    cellar :any_skip_relocation
    root_url "https://homebrew.bintray.com/bottles"
    sha256 "5a70fd60007975ce224824b1a8852ba9124faa6753061d0ecc024be4cebd6e8b" => :mojave
    sha256 "6d69384a2bfa22e24189cdaab477fa4a18703e7e5fed859454e822b4f28f4658" => :high_sierra
  end

  depends_on "ruby" if MacOS.version <= :sierra

  def install
    ENV["GEM_HOME"] = HOMEBREW_PREFIX/"Cellar/cocoapods/1.7.5/libexec"
    system "gem", "build", "cocoapods.gemspec"
    system "gem", "install", "cocoapods-#{version}.gem"
    # Other executables don't work currently.
    bin.install HOMEBREW_PREFIX/"Cellar/cocoapods/1.7.5/libexec/bin/pod", HOMEBREW_PREFIX/"Cellar/cocoapods/1.7.5/libexec/bin/xcodeproj"
    bin.env_script_all_files(HOMEBREW_PREFIX/"Cellar/cocoapods/1.7.5/libexec/bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/pod", "list"
  end
end
