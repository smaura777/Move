//
//  Exercise.m
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

-(id)initWithName:(NSString *)name
      Description:(NSString *)desc
         Category:(NSString *)cat
            Image:(UIImage *)img
               ID:(NSString *)eid{
    
    if ( self = [super init]){
        _name = name;
        _description = desc;
        _category = cat;
        _image = img;
        _exercise_id = eid;
        
    }
    
    return self;
}

-(id)init {
    return [self initWithName:@"Spinning"
                  Description:@"Improve leg resistence"
                     Category:@"Cardio"
                        Image:nil ID:@"1011"];
}

@end
