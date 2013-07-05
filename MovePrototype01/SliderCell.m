//
//  SliderCell.m
//  MovePrototype01
//
//  Created by samuel maura on 7/4/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "SliderCell.h"

@implementation SliderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)sliderUpdated:(id)sender {
    NSLog(@"VALUE : %f", [self.slider value]);
}
@end
