//
//  ActivityDataController.m
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "ActivityDataController.h"
#import "Activity.h"
#import "AFJSONRequestOperation.h"


@interface ActivityDataController()

- (void)initializeDefaultActivityList;

@end


@implementation ActivityDataController


+ (id)sharedInstance
{
    
    /** TEST for AFNET  **/
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/activity/json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            //NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
        NSLog(@"JSON == %@",[JSON description]);
        NSLog(@"JSON == %@",JSON );
                }
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response,NSError *error,id JSON){
                
                    NSLog(@"ERROR IN REQUEST");

                }];
    
    [operation start];
    
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}



- (id)init {
    if (self = [super init]) {
        [self initializeDefaultActivityList];
       
        return self;
    }
    return nil;
}


- (void)initializeDefaultActivityList {
    NSMutableArray *activityList = [[NSMutableArray alloc] init];
    self.masterActivityList = activityList;
    Activity *act,*act2;
    act = [[Activity alloc] initForCardioWithName:@"stationary bike"
        reps:@"1" sets:@"1" tibs:@"5"
        distance:@"8 miles" speed:@"20 miles/hour"
        duration:@"40 minutes"];
    
    act2 = [[Activity alloc] initForWeightTrainingWithName:@"Shoulder Press"
            weight:@"80 lbs" reps:@"15"
            sets:@"4" tibs:@"3 minutes"
            duration:@"1"];
    
    [self addActivityLog:act];
    [self addActivityLog:act2];
    
}


#pragma setter

-(void)setMasterActivityList:(NSMutableArray *)masterActivityList {
    
    if (_masterActivityList != masterActivityList)
        _masterActivityList = [masterActivityList mutableCopy];
    
}

#pragma exposed methods

- (NSUInteger)countOfList {
    return [self.masterActivityList count];
}

- (Activity *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterActivityList objectAtIndex:theIndex];
}

- (void)addActivityLog:(Activity *)activity {
    [self.masterActivityList addObject:activity];
}

-(void)removeActivityAtIndex:(NSUInteger)theIndex {
    [self.masterActivityList removeObjectAtIndex:theIndex];
}

@end
