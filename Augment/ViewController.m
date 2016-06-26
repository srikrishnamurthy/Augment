@import UIKit;

#import <MyoKit/MyoKit.h>
#import "ViewController.h"
#import "MyoCenter.h"

@implementation ViewController {
	__weak IBOutlet UILabel* connectedField;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	MyoCenter* mc = MyoCenter.sharedCenter;
	[mc addConnectObserver:self];
	[mc addSyncObserver:self];
	[mc addDisconnectObserver:self];
	
}

- (void)myoConnected:(NSNotification*)notif {
	connectedField.textColor = UIColor.greenColor;
	connectedField.text = @"Connected";
}

- (void)myoSynced:(NSNotification*)notif {
	UIStoryboard* gu = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	ViewController* vc = (ViewController*)[gu instantiateViewControllerWithIdentifier:@"gugu"];
	MyoCenter* mc = MyoCenter.sharedCenter;
	[mc removeSyncObserver:self];
	[mc removeConnectObserver:self];
	[mc removeDisconnectObserver:self];
	[self showViewController:vc sender:self];
}

-(void)myoDisconnected:(NSNotification*)notif {
	connectedField.textColor = UIColor.redColor;
	connectedField.text = @"Disconnected";
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)connect:(id)sender {
	assert([sender isKindOfClass:UIButton.class]);
	UINavigationController* controller = [TLMSettingsViewController settingsInNavigationController];
	[self presentViewController:controller animated:YES completion:nil];
}

@end