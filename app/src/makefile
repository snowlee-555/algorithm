
PRIVATE_ROOT_DIR := ../..

include $(PRIVATE_ROOT_DIR)/manul/compilerule.mk

#The include directory
INCLUDEDIR += $(addprefix $(PRIVATE_ROOT_DIR)/,$(INCLUDEDIR_PRI))

DEFINES := $(DEFINES)
LIBS := $(LIBS)
LIBDIR := $(LIBDIR)

SOURCE := $(wildcard *.c)
SOURCE += $(wildcard *.cpp)

CFLAGS := $(CFLAGS) $(addprefix -I,$(INCLUDEDIR)) $(addprefix -D,$(DEFINES))
CXXFLAGS := $(CFLAGS)

OBJS := $(patsubst %.c,%.o,$(SOURCE))
OBJS += $(patsubst %.cpp,%.o,$(SOURCE))
OBJS := $(addprefix $(OBJDIR)/,$(OBJS))
DEPS := $(patsubst %.o,%.d,$(OBJS))
MISSING_DEPS := $(filter-out $(wildcard $(DEPS)),$(DEPS))
MISSING_DEPS_SOURCES := $(wildcard $(patsubst %.d,%.c,$(MISSING_DEPS)))
..PHONY : deps objs
everything : $(OBJS)
deps : $(DEPS)
objs : $(OBJS)

ifneq (,$(MISSING_DEPS))
$(MISSING_DEPS) :
	@$(RM-F) $(patsubst %.d,%.o,$@)
endif

-include $(DEPS)
..PHONY :  clean rebuild everything

clean :
	@rm -rf $(OBJDIR)
	@$(RM-F) *.o *.d *.gcno *.gcda *.gcov

rebuild: clean everything

all: $(OBJS)

$(OBJDIR)/%.o : %.c
	@echo Compiling $< ...
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

$(OBJDIR)/%.o : %.cpp | $(OBJDIR)
	@echo Compiling $< ...
	$(CPP) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
