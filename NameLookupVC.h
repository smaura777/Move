//
//  NameLookupVC.h
//  MovePrototype01
//
//  Created by samuel maura on 7/10/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
@protocol  NameLookupVCProtocol;


@interface NameLookupVC : UITableViewController

@property (weak) id<NameLookupVCProtocol> delegate;

@end


@protocol NameLookupVCProtocol <NSObject>

-(void)selectedExecise:(Exercise *)exe;
-(void)deselectedExecise:(Exercise *)exe;

@end