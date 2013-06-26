//
//  MoveDetailViewController.m
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveDetailViewController.h"
#import "Activity.h"
#import "ActivityDataController.h"
#import "MoveEditViewController.h"


@interface MoveDetailViewController ()
- (void)configureView;
@end

@implementation MoveDetailViewController


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
        // Return NO if you do not want the specified item to be editable.
    return NO;
}



#pragma mark - Managing the detail item


- (void)configureView
{
    // Update the user interface for the detail item.

    
        
        Activity *activity = [[ActivityDataController sharedInstance] objectInListAtIndex:self.activityIndex];
    NSLog(@"Activity : \n reps = %@\nsets = %@\nweight = %@\ndistance = %@\n",activity.reps,activity.sets,activity.weight,activity.distance);
    /**
        self.name.text = [activity activity_name];
        self.type.text = [activity activity_type];
        self.weight.text = [activity weight];
        self.reps.text = [activity reps];
        self.sets.text = [activity sets];
        self.distance.text = [activity distance];
        self.speed.text = [activity speed];
        self.duration.text = [activity duration];
        self.tibs.text = [activity tibs];
    
    **/
    
    self.name.text = [activity activity_name];
    self.type.text = [activity activity_type];
    self.duration.text = [activity duration];
    self.tibs.text = [activity tibs];
    
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



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // disable edit mode
    
       
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //  [self.activityDataController removeActivityAtIndex:indexPath.row];
//        // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showEditCtrl"]){
        MoveEditViewController *mv = [[[segue destinationViewController] childViewControllers] lastObject];
        
        [ mv setActivityIndex:self.activityIndex];
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"doneEdit"]){
        [self configureView];
        [self.parent reloadData];
         [self dismissViewControllerAnimated:YES completion:NULL];
    }
   
}


- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelEdit"]){
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


@end
