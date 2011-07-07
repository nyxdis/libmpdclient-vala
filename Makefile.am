bin_PROGRAMS = mpc-vala

AM_CPPFLAGS = $(libmpdclient_CFLAGS) \
	      $(glib_CFLAGS) \
	      $(gobject_CFLAGS)

VALAFLAGS = --pkg libmpdclient \
	    --vapidir $(top_srcdir)/vapi

vapi_DATA = vapi/libmpdclient.vapi

mpc_vala_SOURCES = src/main.vala

mpc_vala_LDADD = $(libmpdclient_LIBS) \
		 $(glib_LIBS) \
		 $(gobject_LIBS)
