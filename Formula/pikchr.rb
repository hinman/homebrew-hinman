class Pikchr < Formula
  desc "Pikchr is a PIC-like markup language for diagrams in technical documentation."
  homepage "https://pikchr.org/home/home"
  url "https://pikchr.org/home/tarball/221988914e/pikchr-221988914e.tar.gz"
  version "221988914e"
  sha256 "a79d322ce73ca87ecb93b775ba2ab3ff34db08f4cf91119c448067e1c1dd084a"
  license "0BSD"

  def install
	system ENV.cc, "-DPIKCHR_SHELL", "-o", "pikchr", "pikchr.c", "-lm"
	bin.install "pikchr"
  end

  test do
	svg = shell_output("/bin/echo box | #{bin}/pikchr --svg-only -").strip
	assert_match %r{\A<svg.*</svg>\Z}ims, svg
  end
end
