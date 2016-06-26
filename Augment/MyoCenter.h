#import <Foundation/Foundation.h>
#import <MyoKit/MyoKit.h>

@interface MyoCenter : NSObject

+ (instancetype)sharedCenter;

- (TLMMyo*)myo;

- (void)addSyncObserver:(id)obj;
- (void)addConnectObserver:(id)obj;
- (void)removeSyncObserver:(id)obj;
- (void)removeConnectObserver:(id)obj;
- (void)addDisconnectObserver:(id)obj;
- (void)removeDisconnectObserver:(id)obj;
- (void)addGestureObserver:(id)sender;
- (void)removeGestureObserver:(id)sender;

@end