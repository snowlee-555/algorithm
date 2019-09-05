..PHONY : clean
export PROJ_ROOT := $(shell pwd)/..
include ./compilerule.mk

DIRS = ../app

#The include directory
INCLUDEDIR_PRI += \
			app/inc

export INCLUDEDIR_PRI

TARGET := ../snowlee
LIBSDIR := 
LIBS :=

# Alter any implicit rules' variables:
OBJS := $(addsuffix /src/$(OBJDIR)/*.o,$(DIRS))

##################################################################################
all rebuild:
	@echo $(DIRS)   $(INCLUDEDIR_PRI) $(OBJS)
	@for i in $(DIRS);do \
		echo;\
		$(MAKE) -C $$i/src $@ test_flag=true || exit 1; \
	done
	$(CC) -o $(TARGET) $(OBJS) $(addprefix -L,$(LIBSDIR)) $(addprefix -l,$(LIBS))

clean:
	@for i in $(DIRS);do \
		echo;\
		$(MAKE) -C $$i/src $@ || exit 1; \
	done
	@$(RM-F) $(TARGET) 
	@$(RM-RF) $(OBJDIR)
