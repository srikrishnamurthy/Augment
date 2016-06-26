@import UIKit;
@import CoreLocation;

#import "GuController.h"
#import "TGCameraNavigationController.h"
#import "GestureViewController.h"
#import "TGCameraViewController.h"
#import "MyoCenter.h"
#import "gugu.h"
#import "Title.h"

TGCameraViewController* GU_CAMER_VC = nil;
TGPhotoViewController* GU_CAMERA_PVC = nil;
Title* GU = nil;

@implementation GestureViewController {
	int goo;
	int cai;
	UIImage* gugugu;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	goo = 0;
	cai = 0;
	MyoCenter* mc = [MyoCenter sharedCenter];
	[mc addGestureObserver:self];
	[mc.myo unlockWithType:TLMUnlockTypeHold];
	[mc.myo indicateUserAction];
}

- (void)myoGesture:(NSNotification*)notif {
	TLMPose* pose = notif.userInfo[kTLMKeyPose];
	switch (pose.type) {
		case TLMPoseTypeFist: {
			if (cai != 0)
				break;
			
			if (goo == 0) {
				TGCameraNavigationController* gu = [TGCameraNavigationController newWithCameraDelegate:self];
				goo = 1;
				[self showViewController:gu sender:self];
			}
			
			else if (goo == 1) {
				gugugu = [GU_CAMERA_PVC photoView].image;
				[GU_CAMER_VC shotTapped];
				goo = 2;
			}
			
			else if (goo == 2) {
				[GU_CAMERA_PVC confirmTapped];
				goo = 0;
			}
			
			break;
		}
		
		case TLMPoseTypeFingersSpread:
			if (goo != 0)
				break;
			
			if (cai == 0) {
				GU = [[Title alloc] init];
				[self showViewController:GU sender:self];
				cai = 1;
			}
			
			else if (cai == 1) {
				[GU takePhoto];
				cai = 2;
			}
			
			else if (cai == 2) {
				[FUCK_YOU_GU capture];
				cai = 3;
			}
			
			else {
				cai = 0;
			}
			
			break;
		
		default:
			NSLog(@"This is a Guish gesture.");
	}
	
	MyoCenter* mc = [MyoCenter sharedCenter];
	[mc.myo unlockWithType:TLMUnlockTypeHold];
	[mc.myo indicateUserAction];
}

- (void)cameraDidCancel {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidTakePhoto:(UIImage*)image {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidSelectAlbumPhoto:(UIImage*)image {
	// Do something ????
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraWillTakePhoto
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)cameraDidSavePhotoAtPath:(NSURL *)assetURL
{
	NSLog(@"%s album path: %@", __PRETTY_FUNCTION__, assetURL);
}

- (void)cameraDidSavePhotoWithError:(NSError *)error
{
	NSLog(@"%s error: %@", __PRETTY_FUNCTION__, error);
}


@end