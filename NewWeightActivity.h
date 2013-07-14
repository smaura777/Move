//
//  NewWeightActivity.h
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewWeightActivity : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *repetitionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;


@property (weak, nonatomic) IBOutlet UISlider *setsSlider;
@property (weak, nonatomic) IBOutlet UISlider *repetitionsSlider;
@property (weak, nonatomic) IBOutlet UISlider *weightSlider;
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;

- (IBAction)setsSliderChanged:(id)sender;
- (IBAction)repetitionSliderChanged:(id)sender;
- (IBAction)weightSliderChanged:(id)sender;
- (IBAction)durationSliderChanged:(id)sender;

@end
