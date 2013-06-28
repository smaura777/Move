//
//  MoveDetailViewController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MoveDetailViewController : UITableViewController

@property (nonatomic) NSUInteger activityIndex;
@property (weak, nonatomic) UITableView *parent;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *reps;
@property (weak, nonatomic) IBOutlet UILabel *sets;

@property (weak, nonatomic) IBOutlet UILabel *duration;

@property (weak, nonatomic) IBOutlet UILabel *distance;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *weight;

@property (weak, nonatomic) IBOutlet UILabel *speed;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end