require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.7.1'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '381164bafbc401dabad256d6c280cc5e'

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
