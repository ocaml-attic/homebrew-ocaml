require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.5.0'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '8167bac61890c004acee79f9cbc3d895'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "PREFIX=#{prefix}", "install"
  end
end
