//
//  MoveEditViewController.h
//  MovePrototype01
//
//  Created by Maura, Sam on 6/19/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MoveEditViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic) NSUInteger activityIndex;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *type;

@property (weak, nonatomic) IBOutlet UITextField *reps;
@property (weak, nonatomic) IBOutlet UITextField *sets;
@property (weak, nonatomic) IBOutlet UITextField *distance;


@property (weak, nonatomic) IBOutlet UITextField *duration;
@property (weak, nonatomic) IBOutlet UITextField *tibs;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *speed;

@end
