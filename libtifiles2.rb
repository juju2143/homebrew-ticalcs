class Libtifiles2 < Formula
  desc "TI files library"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://downloads.sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-1.18/libtifiles2-1.1.7.tar.bz2"
  sha256 "9ac63b49e97b09b30b37bbc84aeb15fa7967bceb944e56141c5cd5a528acc982"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libarchive"
  depends_on "libticonv"

  def install
    mkdir "m4"
    system "autoreconf", "-fi"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
