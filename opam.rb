require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.6.0'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '00a9c02bf44ddd2e68f1a777698397eb'

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
