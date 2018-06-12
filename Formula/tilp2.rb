class Tilp2 < Formula
  desc "TI graphing calculator link/transfer program"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://downloads.sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-1.18/tilp2-1.18.tar.bz2"
  sha256 "7b3ab363eeb52504d6ef5811c5d264f8016060bb7bd427be5a064c2ed7384e47"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+"
  depends_on "libticalcs2"
  depends_on "gfm" => :optional

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
    url "https://aur.archlinux.org/cgit/aur.git/plain/remove-broken-kde-support.patch?h=tilp&id=3cceb1cf63915cab77d205cdd6b7a2b01519d983"
    sha256 "f659d7eae872f6448b7f0e7317e34c6a0c1c0b5d984f80d502bc660bad7819f4"
  end

  test do
    system "false"
  end
end
