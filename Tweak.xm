#import "../PS.h"

%group iOS8

%hook CAMCaptureController

- (BOOL)_useSmoothFocus
{
	return YES;
}

%end

%end

%group preiOS8

%hook PLCameraController

- (void)lockFocusForRecording
{
	return;
}

%end

%end

%ctor
{
	if (isiOS8Up) {
		%init(iOS8);
	} else {
		%init(preiOS8);
	}
}