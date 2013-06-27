//
//  UIApplication+NetworkActivityManager.m
//  MovePrototype01
//
//  Created by Maura, Sam on 6/27/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "UIApplication+NetworkActivityManager.h"

//@interface UIApplication (NetworkActivityManager)
//   @property (atomic,readwrite) NSInteger Move_networkActivityCount;
//@end
//

@implementation UIApplication (NetworkActivityManager)
    //@synthesize Move_networkActivityCount;
static NSInteger Move_networkActivityCount = 0 ;


-(void) Move_pushNetworkActivity {
    @synchronized(self){
        Move_networkActivityCount++;
    }
  [self Move_refreshNetworkActivity];
}
-(void) Move_popNetworkActivity {
    @synchronized(self){
        if (Move_networkActivityCount > 0){
            Move_networkActivityCount--;
        }
        else {
            Move_networkActivityCount = 0;
        }
    }
    
    [self Move_refreshNetworkActivity];
}
-(void) Move_refreshNetworkActivity {
    if (![NSThread isMainThread]){
        SEL refreshSelector = @selector(Move_refreshNetworkActivity);
        [self performSelectorOnMainThread:refreshSelector withObject:nil waitUntilDone:NO];
    }
    else {
        self.networkActivityIndicatorVisible = (Move_networkActivityCount > 0);
        NSLog(@" Move_networkActivityCount = %d ",Move_networkActivityCount);
    }
}


@end
