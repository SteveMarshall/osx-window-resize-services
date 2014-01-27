default:

# HACK: Use ~ evaluates too late for target pattern matching, so use $(HOME)
LOCAL_SCRIPT_LIB=$(HOME)/Library/Scripts/Script\ Library
LOCAL_SERVICES_LIB=$(HOME)/Library/Services
INSTALLED_SERVICES=                        \
	$(LOCAL_SERVICES_LIB)/640×480.workflow   \
	$(LOCAL_SERVICES_LIB)/800×600.workflow   \
	$(LOCAL_SERVICES_LIB)/1024×768.workflow  \
	$(LOCAL_SERVICES_LIB)/1280×1024.workflow \
	$(LOCAL_SERVICES_LIB)/Resize.workflow

clean:
	rm -rf $(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt $(INSTALLED_SERVICES)

$(LOCAL_SCRIPT_LIB):
	mkdir -p "$@"

$(LOCAL_SERVICES_LIB):
	mkdir -p "$@"

$(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt: $(LOCAL_SCRIPT_LIB) scripts/ResizeHelpers.scpt
	cp scripts/ResizeHelpers.scpt "$@"

$(INSTALLED_SERVICES): $(LOCAL_SERVICES_LIB)

$(INSTALLED_SERVICES): $(LOCAL_SERVICES_LIB)/%.workflow: services/%.workflow
	cp -r "$<" "$@"

install: $(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt $(INSTALLED_SERVICES)
