//
//  NewActivityVC.h
//  MovePrototype01
//
//  Created by samuel maura on 7/10/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameLookupVC.h"
@class  Activity;



@interface NewActivityVC : UITableViewController <NameLookupVCProtocol>

@property (nonatomic,strong) Activity * activity;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *repetitionLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UISlider *setsSlider;
@property (weak, nonatomic) IBOutlet UISlider *repetitionSlider;
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;
@property (weak, nonatomic) IBOutlet UISlider *distanceSlider;

- (IBAction)setsSliderChanged:(id)sender;
- (IBAction)repetitionSliderChanged:(id)sender;
- (IBAction)durationSliderChanged:(id)sender;
- (IBAction)distanceSliderChanged:(id)sender;

@property (nonatomic,strong) Exercise *exercise;

@end

