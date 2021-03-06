//
//  MoveSetPropertiesViewController.h
//  MovePrototype01
//
//  Created by Maura, Sam on 6/28/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveSetPropertiesViewController : UITableViewController
{
    NSArray *_data;
    NSArray *_dataKey;
}

@property (nonatomic,strong) NSString *exerciseType;
@property (nonatomic,strong) NSArray *weightTrainingProperties;
@property (nonatomic,strong) NSArray *cardioTrainingProperties;

//@property (weak, nonatomic) IBOutlet UILabel *propertyValue;
//@property (weak, nonatomic) IBOutlet UILabel *propertyLabel;
//@property (weak, nonatomic) IBOutlet UISlider *propertySlider;
//- (IBAction)updateProperty:(id)sender;

@end
