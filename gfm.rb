class Gfm < Formula
  desc "TIgroup files manipulator for TiLP"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://downloads.sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-1.18/gfm-1.08.tar.bz2"
  sha256 "09031ac0abf686b6a8bc9935f331ef460415783a1057f11b0af993526b52017f"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libglade"
  depends_on "libticalcs2"

  def install
    mkdir "m4"
    system "autoreconf", "-fi"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  patch do
    url "https://aur.archlinux.org/cgit/aur.git/plain/remove-broken-kde-support.patch?h=gfm&id=b8745c9a360946f6fe6f61b3d21650059ac73a65"
    sha256 "e5fce2a297c00bb628024d626b70358daa6c490fe9f7f814e44328f66718d208"
  end

  test do
    system "false"
  end
end
