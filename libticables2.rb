class Libticables2 < Formula
  desc "TI link cable library"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://downloads.sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-1.18/libticables2-1.3.5.tar.bz2"
  sha256 "0c6fb6516e72ccab081ddb3aecceff694ed93aec689ddd2edba9c7c7406c4522"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "libusb"

  def install
    mkdir "m4"
    system "autoreconf", "-fi"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-logging",
                          "--enable-libusb10"
    system "make", "install"
  end

  test do
    system "false"
  end
end
