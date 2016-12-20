#import "../PS.h"
#import <AVFoundation/AVFoundation.h>

%group iOS8

%hook CAMCaptureController

- (BOOL)_useSmoothFocus
{
	return YES;
}

%end

%hook AVCaptureFigVideoDevice_FigRecorder

- (BOOL)isSmoothAutoFocusSupported
{
	return YES;
}

%end

%end

%group iOS9

%hook AVCaptureDeviceFormat

- (NSInteger)autoFocusSystem
{
	return 2;
}

%end

%hook CAMFocusCommand

- (BOOL)_shouldUseSmoothFocus
{
	return YES;
}

%end

%end

%group iOS8Up

%hook AVCaptureFigVideoDevice

- (BOOL)isSmoothAutoFocusSupported
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
		if (isiOS9Up) {
			openCamera9();
			%init(iOS9);
		} else {
			openCamera8();
			%init(iOS8);
		}
		%init(iOS8Up);
	} else {
		%init(preiOS8);
	}
}