require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.3.2'
  homepage 'https://github.com/OCamlPro/opam'
  md5 'ca025e670fa4dd9b3b7bd4a030f38abc'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "BIN=#{prefix}/bin", "install"
  end
end
