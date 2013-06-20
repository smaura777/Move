//
//  MoveMasterViewController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActivityDataController;


@interface MoveMasterViewController : UITableViewController
@property (strong, nonatomic) ActivityDataController   *activityDataController;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
