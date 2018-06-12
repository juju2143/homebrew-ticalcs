class Tilem < Formula
  desc "TI calculator emulator"
  homepage "http://lpg.ticalc.org/prj_tilem/"
  url "https://downloads.sourceforge.net/tilem/tilem-2.0.tar.bz2"
  sha256 "fc27235a402dfbee35a15a5aa7c9603211ffa5a1f8b1716310ce8f0b7f4743ad"
  depends_on "pkg-config" => :build
  depends_on "gtk+"
  depends_on "libticalcs2"

  def install
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
