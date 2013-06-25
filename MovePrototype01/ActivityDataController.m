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
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"


@interface ActivityDataController()

- (void)initializeDefaultActivityList;
- (void)addActivityLog:(Activity *)activity;
- (void)refreshActivityList;


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
    /**
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
    **/
    [self refreshActivityList];
    
}


// Refresh list from server 
-(void)refreshActivityList {
    NSString *activityBaseURL = @"http://localhost:3000/activity";
    NSURL *activityBaseUrl = [NSURL URLWithString:activityBaseURL];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:activityBaseUrl];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    [client getPath:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
     NSLog(@"GET succeeded ");
        
        if (!responseObject)
            return;
     
        NSArray *responseSet = (NSArray *)responseObject;
        NSMutableArray *newActivityList = [[NSMutableArray alloc] init];
        
        
        
        for (NSDictionary *di in responseSet){
            Activity *activity = [[Activity alloc] init];
            NSLog(@"%@ \n ============================ \n",di);
            
            if ([[di objectForKey:@"type"] isEqual:@"weight"]){
                NSLog(@"TYPE == weight");
                activity.activity_name = [di objectForKey:@"name"];
                activity.activity_type = [di objectForKey:@"type"];
                activity.user_id = [di objectForKey:@"uid"];
                activity.duration = [di objectForKey:@"duration"];
                activity.reps = [di objectForKey:@"reps"];
                activity.sets = [di objectForKey:@"sets"];
                //activity.heartRate = [di objectForKey:@"heart_rate"];
                activity.activity_id = [di objectForKey:@"_id"];
                
            }
            else {
                NSLog(@"TYPE == CARDIO");
                activity.activity_name = [di objectForKey:@"name"];
                activity.activity_type = [di objectForKey:@"type"];
                activity.user_id = [di objectForKey:@"uid"];
                activity.duration = [di objectForKey:@"duration"];
                activity.speed = [di objectForKey:@"speed"];
                activity.distance = [di objectForKey:@"distance"];
                //activity.heartRate = [di objectForKey:@"heart_rate"];
                activity.activity_id = [di objectForKey:@"_id"];
            }
         
            [newActivityList addObject:activity];
        }
     
       self.masterActivityList = newActivityList;
       [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatedActivityNotification" object:nil];
     
     
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"GET Failed : %@ ",[error description]);
    }];
    
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
    
    NSMutableDictionary *ad = [[NSMutableDictionary alloc] init];
    
    if (activity.activity_name)
        [ad setObject:activity.activity_name forKey:@"name"];
    
    if (activity.activity_type)
        [ad setObject:activity.activity_type forKey:@"type"];
    
    if (activity.user_id)
        [ad setObject:activity.user_id forKey:@"id"];
    
    if (activity.weight)
        [ad setObject:activity.weight forKey:@"weight"];
    
    if (activity.reps)
        [ad setObject:activity.reps forKey:@"reps"];
    
    if (activity.sets)
        [ad setObject:activity.sets forKey:@"sets"];
    
    if (activity.distance)
        [ad setObject:activity.distance forKey:@"distance"];
    
    if (activity.speed)
        [ad setObject:activity.speed forKey:@"speed"];
    
    if (activity.duration)
        [ad setObject:activity.duration forKey:@"duration"];
    
    
    NSString *activityBaseURL = @"http://localhost:3000/activity/create";
    NSURL *activityBaseUrl = [NSURL URLWithString:activityBaseURL];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:activityBaseUrl];
        //[client registerHTTPOperationClass:[AFJSONRequestOperation class]];
        //[client setDefaultHeader:@"Accept" value:@"application/json"];
    [client postPath:@"" parameters:ad success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST succeeded ");
        [self refreshActivityList];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatedActivityNotification" object:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"POST Failed : %@ ",[error description]);
    }];

}

-(void)removeActivityAtIndex:(NSUInteger)theIndex {
    Activity *del = [self.masterActivityList objectAtIndex:theIndex];
    NSLog(@"Will remove activity with ID %@",del.activity_id);
    
    [self.masterActivityList removeObjectAtIndex:theIndex];
    
    //[self refreshActivityList];
}

- (void)updateActivityAtIndex:(NSUInteger)theIndex {

}

@end
