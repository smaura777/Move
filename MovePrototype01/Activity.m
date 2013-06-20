//
//  activity.m
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "Activity.h"

#define kUserID  @"smaura@me.com";

@implementation Activity


-(id)initForWeightTrainingWithName:(NSString *)name
                            weight:(NSString *)weight
                              reps:(NSString *)reps
                              sets:(NSString *)sets
                              tibs:(NSString *)tibs
                          duration:(NSString *)duration
{
    self = [super init];
    if (self) {
        _activity_id = [[NSUUID UUID] UUIDString];
        _user_id = kUserID;
        _activity_name = name;
        _activity_type = @"weight";
        _weight = weight;
        _reps = reps;
        _sets = sets;
        _tibs = tibs;
        _duration = duration;
        
        return self;
    }
    
    return nil;
}

-(id)initForCardioWithName:(NSString *)name
                      reps:(NSString *)reps
                      sets:(NSString *)sets
                      tibs:(NSString *)tibs
                  distance:(NSString *)distance
                     speed:(NSString *)speed
                  duration:(NSString *)duration
{
    self = [super init];
    if (self) {
         _activity_id = [[NSUUID UUID] UUIDString];
         _user_id = kUserID;
        _activity_name = name;
        _activity_type = @"cardio";
        _speed = speed;
        _reps = reps;
        _sets = sets;
        _tibs = tibs;
        _duration = duration;
        
        return self;
    }
    
    return nil;
}




@end
