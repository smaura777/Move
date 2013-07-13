//
//  Exercise.h
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (strong,nonatomic) NSString *name;
@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) NSString *category;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSString *exercise_id;

-(id)initWithName:(NSString *)name
       Description:(NSString *)desc
       Category:(NSString *)cat
       Image:(UIImage *)img
       ID:(NSString *)eid;

@end
