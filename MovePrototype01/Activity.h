//
//  activity.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject

@property (nonatomic,copy) NSString *activity_name;
@property (nonatomic,copy) NSString *activity_id;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *activity_type;
@property (nonatomic,copy) NSString *weight;
@property (nonatomic,copy) NSString *reps;
@property (nonatomic,copy) NSString *sets;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *speed;
@property (nonatomic,copy) NSString *tibs;
@property (nonatomic,copy) NSString *duration;




-(id)initForWeightTrainingWithName:(NSString *)name
          weight:(NSString *)weight
          reps:(NSString *)reps
          sets:(NSString *)sets
          tibs:(NSString *)tibs
          duration:(NSString *)duration;


-(id)initForCardioWithName:(NSString *)name
            reps:(NSString *)reps
            sets:(NSString *)sets
            tibs:(NSString *)tibs
            distance:(NSString *)distance
            speed:(NSString *)speed
            duration:(NSString *)duration;





@end
