//
//  MoveMasterViewController.h
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class ActivityDataController;


@interface MoveMasterViewController : UITableViewController <EGORefreshTableHeaderDelegate> {

EGORefreshTableHeaderView *_refreshHeaderView;

	//  Reloading var should really be your tableviews datasource
	//  Putting it here for demo purposes
BOOL _reloading;

}

@property (strong, nonatomic) ActivityDataController   *activityDataController;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
