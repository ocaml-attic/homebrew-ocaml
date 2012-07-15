require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.2'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '13931989b390821f0d9c822dbf266fcb'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "BIN=#{prefix}/bin", "install"
  end
end
