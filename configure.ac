AC_INIT([mpc-vala], [0.21], [mende.christoph@gmail.com])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([dist-bzip2 foreign subdir-objects])

AC_PROG_CC
AC_PATH_PROG(VALAC, valac, valac)
AC_SUBST(VALAC)

PKG_PROG_PKG_CONFIG([0.25])
PKG_CHECK_MODULES([libmpdclient], [libmpdclient >= 2.4])
PKG_CHECK_MODULES([glib], [glib-2.0])
PKG_CHECK_MODULES([gobject], [gobject-2.0])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
