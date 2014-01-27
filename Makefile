default:

LOCAL_SCRIPT_LIB=~/Library/Scripts/Script\ Library

clean:
	rm $(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt

$(LOCAL_SCRIPT_LIB):
	mkdir -p "$@"

$(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt: $(LOCAL_SCRIPT_LIB) scripts/ResizeHelpers.scpt
	cp scripts/ResizeHelpers.scpt "$@"

install: $(LOCAL_SCRIPT_LIB)/ResizeHelpers.scpt
