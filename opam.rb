require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.1'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '287548417eb131b288420c976b6ee7a8'

  head 'https://github.com/OCamlPro/opam.git'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "BIN=#{prefix}/bin", "install"
  end
end
