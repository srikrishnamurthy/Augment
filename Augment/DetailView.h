//
//  DetailView.h
//  Shokuji
//
//  Created by Kevin Frans on 9/4/15.
//  Copyright © 2015 Kevin Frans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuController.h"

@interface DetailView : UIViewController<UIGestureRecognizerDelegate>

-(void) setParent:(GuController*) vc;
-(void) setImage:(UIImage*) theimg;
-(void) setJson:(NSString *)json;

-(void) sendRequest:(NSURLRequest*)request;

@end