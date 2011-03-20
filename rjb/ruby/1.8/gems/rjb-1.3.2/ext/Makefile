
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /Users/lgleason/.rvm/rubies/ruby-1.8.7-p302/lib/ruby/1.8/i686-darwin10.5.0
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/Users/lgleason/.rvm/rubies/ruby-1.8.7-p302
sharedstatedir = $(prefix)/com
mandir = $(datarootdir)/man
psdir = $(docdir)
oldincludedir = $(DESTDIR)/usr/include
localedir = $(datarootdir)/locale
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec
sitedir = $(libdir)/ruby/site_ruby
htmldir = $(docdir)
vendorarchdir = $(vendorlibdir)/$(sitearch)
includedir = $(prefix)/include
infodir = $(datarootdir)/info
vendorlibdir = $(vendordir)/$(ruby_version)
sysconfdir = $(prefix)/etc
libdir = $(exec_prefix)/lib
sbindir = $(exec_prefix)/sbin
rubylibdir = $(libdir)/ruby/$(ruby_version)
docdir = $(datarootdir)/doc/$(PACKAGE)
dvidir = $(docdir)
vendordir = $(libdir)/ruby/vendor_ruby
datarootdir = $(prefix)/share
pdfdir = $(docdir)
archdir = $(rubylibdir)/$(arch)
sitearchdir = $(sitelibdir)/$(sitearch)
datadir = $(datarootdir)
localstatedir = $(prefix)/var
sitelibdir = $(sitedir)/$(ruby_version)

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = extconf.h
CFLAGS   =  -fno-common -g -O2  -fno-common -pipe -fno-common $(cflags) -I"/Library/Java/JavaVirtualMachines/1.6.0_24-b07-334.jdk/Contents/Home/include" 
INCFLAGS = -I. -I. -I/Users/lgleason/.rvm/rubies/ruby-1.8.7-p302/lib/ruby/1.8/i686-darwin10.5.0 -I. -I"/Library/Java/JavaVirtualMachines/1.6.0_24-b07-334.jdk/Contents/Home/include"
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\"  -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE  
CXXFLAGS = $(CFLAGS) 
ldflags  = -L. 
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = cc -dynamic -bundle -undefined suppress -flat_namespace
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = i686-darwin10.5.0
sitearch = i686-darwin10.5.0
ruby_version = 1.8
ruby = /Users/lgleason/.rvm/rubies/ruby-1.8.7-p302/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED)  -ldl -lobjc  
SRCS = load.c riconv.c rjb.c rjbexception.c
OBJS = load.o riconv.o rjb.o rjbexception.o
TARGET = rjbcore
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/lgleason/poi_pond/poi_pond/rjb/ruby/1.8/gems/rjb-1.3.2/lib$(target_prefix)
RUBYARCHDIR = /Users/lgleason/poi_pond/poi_pond/rjb/ruby/1.8/gems/rjb-1.3.2/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).bundle $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



###
$(OBJS): $(RUBY_EXTCONF_H)

riconv.o : riconv.c jp_co_infoseek_hp_arton_rjb_RBridge.h
rjb.o : rjb.c jp_co_infoseek_hp_arton_rjb_RBridge.h riconv.h rjb.h
rjbexception.o : rjbexception.c jp_co_infoseek_hp_arton_rjb_RBridge.h riconv.h rjb.h
load.o : load.c jp_co_infoseek_hp_arton_rjb_RBridge.h
jp_co_infoseek_hp_arton_rjb_RBridge.h : jniwrap.h ../data/rjb/jp/co/infoseek/hp/arton/rjb/RBridge.class
	javah -classpath ../data/rjb jp.co.infoseek.hp.arton.rjb.RBridge
../data/rjb/jp/co/infoseek/hp/arton/rjb/RBridge.class : RBridge.java
	mkdir -p ../data/rjb/jp/co/infoseek/hp/arton/rjb
	javac -d ../data/rjb RBridge.java
test : rjbcore.so ../test/jp/co/infoseek/hp/arton/rjb/Test.class ../test/jp/co/infoseek/hp/arton/rjb/IBase.class ../test/jp/co/infoseek/hp/arton/rjb/Base.class ../test/jp/co/infoseek/hp/arton/rjb/ExtBase.class 
	ruby ../test/test.rb
../test/jp/co/infoseek/hp/arton/rjb/Test.class : ../test/Test.java 
	javac ../test/Test.java
	$(RUBY) -r fileutils -e 'FileUtils.mkdir_p "../test/jp/co/infoseek/hp/arton/rjb";FileUtils.mv("../test/Test.class", "../test/jp/co/infoseek/hp/arton/rjb")'
../test/jp/co/infoseek/hp/arton/rjb/IBase.class : ../test/IBase.java 
	javac ../test/IBase.java
	$(RUBY) -r fileutils -e 'FileUtils.mkdir_p "../test/jp/co/infoseek/hp/arton/rjb";FileUtils.mv("../test/IBase.class", "../test/jp/co/infoseek/hp/arton/rjb")'
../test/jp/co/infoseek/hp/arton/rjb/Base.class : ../test/Base.java ../test/jp/co/infoseek/hp/arton/rjb/IBase.class
	javac -classpath ../test ../test/Base.java
	$(RUBY) -r fileutils -e 'FileUtils.mkdir_p "../test/jp/co/infoseek/hp/arton/rjb";FileUtils.mv("../test/Base.class", "../test/jp/co/infoseek/hp/arton/rjb")'
../test/jp/co/infoseek/hp/arton/rjb/ExtBase.class : ../test/ExtBase.java 
	javac -classpath ../test ../test/ExtBase.java
	$(RUBY) -r fileutils -e 'FileUtils.mkdir_p "../test/jp/co/infoseek/hp/arton/rjb";FileUtils.mv("../test/ExtBase.class", "../test/jp/co/infoseek/hp/arton/rjb")'
