//
//  WeightExerciseLookup.h
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Exercise;
@protocol WeightExerciseLookupProtocol;


@interface WeightExerciseLookup : UITableViewController

@property (weak) id<WeightExerciseLookupProtocol> delegate;

@end


@protocol WeightExerciseLookupProtocol <NSObject>

-(void)selectedWeightExecise:(Exercise *)exe;
-(void)deselectedWeightExecise:(Exercise *)exe;

@end