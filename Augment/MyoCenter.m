@import Foundation;

#import <MyoKit/MyoKit.h>
#import "MyoCenter.h"

@implementation MyoCenter {
	NSMutableArray* registeredConnect;
	NSMutableArray* registeredSync;
	NSMutableArray* registeredDisconnect;
	NSMutableArray* registeredGestures;
}

+ (instancetype)sharedCenter {
	static MyoCenter* instance = nil;
	static dispatch_once_t once_token;
	dispatch_once(&once_token, ^{
		instance = MyoCenter.new;
	});
	
	return instance;
}

- (instancetype)init {
	self = [super init];
	if (self != nil) {
		registeredConnect = NSMutableArray.array;
		registeredSync = NSMutableArray.array;
		registeredDisconnect = NSMutableArray.array;
		registeredGestures = NSMutableArray.array;
		[self registerNotifications];
	}
	
	return self;
}

- (void)registerNotifications {
	NSNotificationCenter* center = NSNotificationCenter.defaultCenter;
	[center addObserver:self selector:@selector(didConnectArm:) name:TLMHubDidConnectDeviceNotification object:nil];
	[center addObserver:self selector:@selector(didSyncArm:) name:TLMMyoDidReceiveArmSyncEventNotification object:nil];
	[center addObserver:self selector:@selector(didDisconnectArm:) name:TLMHubDidDisconnectDeviceNotification object:nil];
	[center addObserver:self selector:@selector(didRunGesture:) name:TLMMyoDidReceivePoseChangedNotification object:nil];
}

// some dummies so Objective-C doesn't complain .-.
- (void)myoDisconnected:(NSNotification*)notif { }
- (void)myoConnected:(NSNotification*)notif { }
- (void)myoSynced:(NSNotification*)notif { }
- (void)myoGesture:(NSNotification*)notif { }

- (void)didConnectArm:(NSNotification*)notif {
	for (id obj in registeredConnect) {
		[obj myoConnected:notif];
	}
}

- (TLMMyo*)myo {
	return [[[TLMHub sharedHub] myoDevices] firstObject];
}

- (void)didSyncArm:(NSNotification*)notif {
	for (id obj in registeredSync) {
		[obj myoSynced:notif];
	}
}

- (void)didDisconnectArm:(NSNotification*)notif {
	for (id obj in registeredDisconnect) {
		[obj myoDisconnected:notif];
	}
}

- (void)addSyncObserver:(id)obj {
	[registeredSync addObject:obj];
}

- (void)addConnectObserver:(id)obj {
	[registeredConnect addObject:obj];
}

- (void)removeConnectObserver:(id)obj {
	[registeredConnect removeObject:obj];
}

- (void)removeSyncObserver:(id)obj {
	[registeredSync removeObject:obj];
}

- (void)addDisconnectObserver:(id)obj {
	[registeredDisconnect addObject:obj];
}

- (void)removeDisconnectObserver:(id)obj {
	[registeredDisconnect removeObject:obj];
}

- (void)addGestureObserver:(id)sender {
	[registeredGestures addObject:sender];
}

- (void)removeGestureObserver:(id)sender {
	[registeredGestures removeObject:sender];
}

- (void)didRunGesture:(id)sender {
	for (id obj in registeredGestures) {
		[obj myoGesture:sender];
	}
}

- (void)dealloc {
	[NSNotificationCenter.defaultCenter removeObserver:self];
}

@end