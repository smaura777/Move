//
//  MoveCreateViewController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/16/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Activity;


@interface MoveCreateViewController : UITableViewController <UITextFieldDelegate>

@property (strong,nonatomic) Activity *activity;



@property (weak, nonatomic) IBOutlet UITextField *type;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *sets;

@property (weak, nonatomic) IBOutlet UITextField *distance;
@property (weak, nonatomic) IBOutlet UITextField *speed;
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *duration;
@property (weak, nonatomic) IBOutlet UITextField *reps;

@end
