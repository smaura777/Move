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


//#define kBaseURL @"http://localhost:8084/activity"
#define kBaseURL @"http://54.243.233.106:8084/activity"

@interface ActivityDataController(){

    AFHTTPClient *client ;
}

- (void)initializeDefaultActivityList;
- (void)addActivityLog:(Activity *)activity;
- (void)refreshActivityList;
- (void)toggleNetworkActivityIndicatorWith:(BOOL)status;
//- (void)updateLookupData;


@end


@implementation ActivityDataController


+ (id)sharedInstance
{
    
    /** TEST for AFNET
    
    
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
    **/
    
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
    
    NSString *activityBaseURL = kBaseURL;
    NSURL *activityBaseUrl = [NSURL URLWithString:activityBaseURL];
    client = [[AFHTTPClient alloc] initWithBaseURL:activityBaseUrl];
   
    
    [self refreshActivityList];
    
}


-(void)enableReachability {
        //[client ];
    
     [client setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       NSLog(@"****** Reachability status changed to :  %d *******", status);
       
         if (status ==  AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable){
             UIAlertView *statusChange = [[UIAlertView alloc] initWithTitle:@"Connection status"
                                                                    message:@"No internet connection"
                                                                    delegate:nil
                                                                    cancelButtonTitle:@"Ok"
                                                                    otherButtonTitles:nil, nil];
             [statusChange show];
         }
         
         }];
       

     }

- (void)toggleNetworkActivityIndicatorWith:(BOOL)status  {
    if (status)
        [[UIApplication sharedApplication] Move_pushNetworkActivity];
    else
        [[UIApplication sharedApplication] Move_popNetworkActivity];
    
    
        //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:status];
}


// Refresh list from server 
-(void)refreshActivityList {
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    self.isLoading = YES;
    
    [client getPath:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"GET succeeded ");
         self.isLoading = NO;
        
        if (!responseObject)
            return;
     
        NSArray *responseSet = (NSArray *)responseObject;
        NSMutableArray *newActivityList = [[NSMutableArray alloc] init];
        
        
        
        for (NSDictionary *di in responseSet){
            Activity *activity = [[Activity alloc] init];
            
            NSLog(@"%@ \n ============================ \n",[di description]);
            
            if ([[di objectForKey:@"type"] isEqual:@"weight"]){
                //NSLog(@"TYPE == weight");
                activity.activity_name = [di objectForKey:@"name"];
                activity.activity_type = [di objectForKey:@"type"];
                activity.user_id = [di objectForKey:@"uid"];
                activity.duration = (NSString *)[di objectForKey:@"duration"];
                activity.reps = (NSString *)[di objectForKey:@"reps"];
                activity.sets = (NSString *)[di objectForKey:@"sets"];
                activity.weight = (NSString *)[di objectForKey:@"weight"];
                
                //activity.heartRate = [di objectForKey:@"heart_rate"];
                activity.activity_id = [di objectForKey:@"_id"];
                
                
                NSLog(@" ACTIVITY \n +++++++++++++\n sets:   %@ \n reps : %@ \n +++++++++++  \n",[activity sets],[activity reps]);
                
            }
            else {
                //  NSLog(@"TYPE == CARDIO");
                activity.activity_name = [di objectForKey:@"name"];
                activity.activity_type = [di objectForKey:@"type"];
                activity.user_id = [di objectForKey:@"uid"];
                activity.duration = (NSString *)[di objectForKey:@"duration"];
                activity.speed = (NSString *)[di objectForKey:@"speed"];
                activity.distance = (NSString *)[di objectForKey:@"distance"];
                //activity.heartRate = [di objectForKey:@"heart_rate"];
                activity.activity_id = [di objectForKey:@"_id"];
            }
         
            [newActivityList addObject:activity];
        }
     
       self.masterActivityList = newActivityList;
       [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatedActivityNotification" object:nil];
     
     
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"GET Failed : %@ ",[error description]);
         self.isLoading = NO;
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
    
    [client setDefaultHeader:@"Accept" value:@"text/html"];
    
    [client postPath:@"create" parameters:ad success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST succeeded ");
        [self refreshActivityList];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"POST Failed : %@ ",[error description]);
    }];

}

-(void)removeActivityAtIndex:(NSUInteger)theIndex {
    Activity *del = [self.masterActivityList objectAtIndex:theIndex];
    NSLog(@"Will remove activity with ID %@",del.activity_id);
    NSMutableDictionary *ad = [[NSMutableDictionary alloc] init];
    [ad setObject:del.activity_id forKey:@"id"];
    [self.masterActivityList removeObjectAtIndex:theIndex];
    
    [client deletePath:[ad objectForKey:@"id"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"DELETE succeeded ");
        [self refreshActivityList];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"DELETE Failed : %@ ",[error description]);
    }];

    
   
    
}

- (void)updateActivityAtIndex:(NSUInteger)theIndex {
    Activity *up = [self.masterActivityList objectAtIndex:theIndex];
    NSLog(@"Will remove activity with ID %@",up.activity_id);
    NSMutableDictionary *ad = [[NSMutableDictionary alloc] init];
    
    [ad setObject:up.activity_id forKey:@"id"];
    
    if (up.activity_name)
        [ad setObject:up.activity_name forKey:@"name"];
    
    if (up.activity_type)
        [ad setObject:up.activity_type forKey:@"type"];
    
    if (up.weight)
        [ad setObject:up.weight forKey:@"weight"];
    
    if (up.reps)
        [ad setObject:up.reps forKey:@"reps"];
    
    if (up.sets)
        [ad setObject:up.sets forKey:@"sets"];
    
    if (up.distance)
        [ad setObject:up.distance forKey:@"distance"];
    
    if (up.speed)
        [ad setObject:up.speed forKey:@"speed"];
    
    if (up.duration)
        [ad setObject:up.duration forKey:@"duration"];
    
     
    [client putPath:[ad objectForKey:@"id"] parameters:ad success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"update succeeded ");
        [self refreshActivityList];
    
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"update Failed : %@ ",[error description]);
    }];

}

-(void)reload {
    [self refreshActivityList];
}


// Lookup data

/**
- (void)updateLookupData {
    NSArray *cardioOutDoor = [NSArray arrayWithObjects:@"jogging",@"biking", @"swimming",@"stair climb",
                        @"jumping rope",@"walking",@"rowing",nil];
    
    NSArray *cardioInDoor =[NSArray arrayWithObjects:
                            @"treadmil run",@"tradmil walk",@"stepper",@"bike",
                            @"elliptical", @"rowing",@"jumping rope", @"swimming",@"stair climb"nil];

    
    NSArray *name = [NSArray arrayWithObjects:cardioInDoor,cardioOutDoor nil];
    
    
        
    NSArray *weightChest =[NSArray arrayWithObjects:
                            @"floor press",@"bench press",@"incline bench press",@"butterfly",
                            @"neck press", @"dumbell pullover",@"bodyweight flyes", @"cable chest press",
                           @"dumbell bench press",@"dumbell flyes",nil];
    
    NSArray *weightArms =[NSArray arrayWithObjects:
                           @"treadmil run",@"tradmil walk",@"stepper",@"bike",
                           @"elliptical", @"rowing",@"jumping rope", @"swimming",@"stair climb"nil];

    
    NSArray *weightLeg =[NSArray arrayWithObjects:
                           @"treadmil run",@"tradmil walk",@"stepper",@"bike",
                           @"elliptical", @"rowing",@"jumping rope", @"swimming",@"stair climb"nil];

    NSArray *weightAbs =[NSArray arrayWithObjects:
                           @"treadmil run",@"tradmil walk",@"stepper",@"bike",
                           @"elliptical", @"rowing",@"jumping rope", @"swimming",@"stair climb"nil];


    NSArray *weight = [NSArray arrayWithObjects:weightChest,weightLeg,weightAbs,weightArms, nil];
    
    
    NSDictionary *cardioName = [NSDictionary dictionaryWithObjects:name
                                forKeys:[NSArray arrayWithObjects:@"indoor",@"outdoor", nil]];
    
    NSDictionary *weightName = [NSDictionary dictionaryWithObjects:weight
                            forKeys:[NSArray arrayWithObjects:@"chest",@"leg",@"abs",@"arms", nil]];
}
**/


-(NSUInteger)activityCategoryCount {

    return 0;
}
-(NSString *)activityCategoryNameAtIndex:(NSUInteger)index {
    return @"No data";
}

-(NSUInteger)activityCategoryListAtIndex:(NSUInteger)index {
    return 0;

}



@end
