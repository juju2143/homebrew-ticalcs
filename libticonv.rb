class Libticonv < Formula
  desc "TI character set conversion library"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://downloads.sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-1.18/libticonv-1.1.5.tar.bz2"
  sha256 "316da6a73bf26b266dd23443882abc4c9fe7013edc3a53e5e301d525c2060878"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "intltool"

  def install
    mkdir "m4"
    system "autoreconf", "-fi"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-iconv"
    system "make", "install"
  end

  patch :DATA

  test do
    system "false"
  end
end
__END__
From 936c2b07da678e1cd284b02ca42571caf506af7e Mon Sep 17 00:00:00 2001
From: Adrien Bertrand <bertrand.adrien@gmail.com>
Date: Wed, 21 Jun 2017 19:16:54 +0200
Subject: [PATCH] libticonv: Fix build on macOS

This now works fine for a system- or brew-provided libiconv.
---
 configure.ac    | 9 +++++++++
 src/Makefile.am | 4 ++++
 src/iconv.c     | 3 +++
 3 files changed, 16 insertions(+)

diff --git a/configure.ac b/configure.ac
index 7cd765ef..fe7e71ce 100644
--- a/configure.ac
+++ b/configure.ac
@@ -87,6 +87,15 @@ case "$host" in
 esac
 CFLAGS="$CFLAGS $ARCH"
 
+build_mac=''
+case "${host_os}" in
+    darwin*)
+        build_mac='yes'
+        ;;
+esac
+
+AM_CONDITIONAL(OS_MAC, test "$build_mac")
+
 # Ensure MSVC-compatible struct packing convention is used when
 # compiling for Win32 with gcc.
 # What flag to depends on gcc version: gcc3 uses "-mms-bitfields", while
diff --git a/src/Makefile.am b/src/Makefile.am
index 694142b4..bb327c58 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -23,3 +23,7 @@ if OS_WIN32
   libticonv_la_LDFLAGS += -Wl,../build/mingw/ticonv-rc.o -Wl,--output-def,libticonv.def
   EXTRA_DIST = libticonv.def
 endif
+
+if OS_MAC
+  libticonv_la_LIBADD += -liconv
+endif
diff --git a/src/iconv.c b/src/iconv.c
index ddb3462a..82618855 100644
--- a/src/iconv.c
+++ b/src/iconv.c
@@ -31,6 +31,9 @@
 #include <stdio.h>
 #include <string.h>
 #include <glib.h>
+#if defined(__MACOSX__)
+#  define LIBICONV_PLUG
+#endif
 #include <iconv.h>
 #include <errno.h>
 
-- 
2.14.1
