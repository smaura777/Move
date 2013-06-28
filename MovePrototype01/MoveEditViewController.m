//
//  MoveEditViewController.m
//  MovePrototype01
//
//  Created by Maura, Sam on 6/19/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveEditViewController.h"
#import "ActivityDataController.h"
#import "Activity.h"


@interface MoveEditViewController ()
- (void)configureView;
@end

@implementation MoveEditViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setActivityIndex:(NSUInteger)activityIndex{
    _activityIndex = activityIndex;
}

- (void)configureView {
   
        
       Activity *activity = [[ActivityDataController sharedInstance] objectInListAtIndex:self.activityIndex];
       self.name.text = [activity activity_name];
       self.type.text = [activity activity_type];
       self.duration.text = [activity duration];
 
      if ([activity.activity_type isEqualToString:@"weight"]){
          self.weight.text = [activity weight];
          self.reps.text = [activity reps];
          self.sets.text = [activity sets];
          
          // Hide the rest
          [self.distance setHidden:YES];
          [self.speed setHidden:YES];
      }
      else {
          self.distance.text = [activity distance];
          self.speed.text = [activity speed];
          
          // Hide the rest
          [self.weight setHidden:YES];
          [ self.reps setHidden:YES];
          [self.sets setHidden:YES];
          
      }
    
        
        
                   

}



#pragma mark - textfield protocol
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = nil;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"doneEdit"]){
        
        Activity *activity = [[ActivityDataController sharedInstance] objectInListAtIndex:self.activityIndex];
        activity.activity_name = self.name.text;
        activity.activity_type = self.type.text;
        
        activity.weight = self.weight.text;
        activity.reps =  self.reps.text;
        activity.sets = self.sets.text;
        activity.distance = self.distance.text;
        activity.speed = self.speed.text;
        activity.duration = self.duration.text ;
       
        [[ActivityDataController sharedInstance] updateActivityAtIndex:self.activityIndex];
    }
}


@end
