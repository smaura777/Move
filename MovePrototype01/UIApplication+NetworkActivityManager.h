//
//  UIApplication+NetworkActivityManager.h
//  MovePrototype01
//
//  Created by Maura, Sam on 6/27/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIApplication (NetworkActivityManager)


-(void) Move_pushNetworkActivity;
-(void) Move_popNetworkActivity;
-(void) Move_refreshNetworkActivity;


@end
