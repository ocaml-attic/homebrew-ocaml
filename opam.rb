require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.7.3'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '14b0315a810a306c69a36cbfbf04b2af'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "./configure", "--prefix", prefix,
                          "--mandir", man
    system "make"
    bin.mkdir
    system "make", "PREFIX=#{prefix}", "install"
  end
end
