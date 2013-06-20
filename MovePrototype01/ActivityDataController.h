//
//  ActivityDataController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Activity;


@interface ActivityDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterActivityList;

- (NSUInteger)countOfList;
- (Activity *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addActivityLog:(Activity *)activity;
-(void)removeActivityAtIndex:(NSUInteger)theIndex;

+ (id)sharedInstance;


@end
