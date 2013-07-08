//
//  ActivityDataController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIApplication+NetworkActivityManager.h"



@class Activity;

@interface ActivityDataController : NSObject
@property (nonatomic, copy) NSMutableArray *masterActivityList;
@property (nonatomic) BOOL isLoading;


- (NSUInteger)countOfList;
- (Activity *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addActivityLog:(Activity *)activity;
- (void)removeActivityAtIndex:(NSUInteger)theIndex;
- (void)updateActivityAtIndex:(NSUInteger)theIndex;
-(void)reload;
-(void)enableReachability;


// Activity lookup properties
// Full data (should be cached)
@property (nonatomic, copy) NSMutableArray *activityLookupData;


/**
 Type KEYS:
    
      cardio :
                name:
                        Machine: Jogging , biking rowing, stairmaster
                        Nature : Jogging , swimming 
                speed:  
                       
                        value:
 
 
      weight:
                name: 
                       chest: bench press...
                       shoulder: ....
                       abs:   ....
                       arms:
                       legs: ....
 
                weight: 
                        
                         value: 
                reps:
 
                sets:
 
                duration: 
                           
                           value:
 
 
 
 
 */



// Activity types (cardio | weight)
-(NSUInteger)activityCategoryCount;
-(NSString *)activityCategoryNameAtIndex:(NSUInteger)index;
-(NSUInteger)activityCategoryListAtIndex:(NSUInteger)index;





+ (id)sharedInstance;


@end
