//
//  SliderCell.h
//  MovePrototype01
//
//  Created by samuel maura on 7/4/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *measure;
@property (weak, nonatomic) IBOutlet UILabel *unit;

- (IBAction)sliderUpdated:(id)sender;

@end
