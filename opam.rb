require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.3.1'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '602203a7dc9a42a616e815b5b7bb05a9'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "BIN=#{prefix}/bin", "install"
  end
end
