//
//  MoveCreateViewController.m
//  MovePrototype01
//
//  Created by samuel maura on 6/16/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveCreateViewController.h"
#import "ActivityDataController.h"
#import "MoveSetPropertiesViewController.h"
#import "NewActivityVC.h"

#import "Activity.h"

@interface MoveCreateViewController ()

@end

@implementation MoveCreateViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    // Additional setup
    NSArray *activity_type = [NSArray arrayWithObjects:@"Cardio training", @"Strenght training", nil];
    NSArray *cardio = [NSArray arrayWithObjects:@"Name",@"Speed",@"Duration",@"Distance", nil];
    NSArray *weight = [NSArray arrayWithObjects:@"Name",@"Sets",@"Reps",@"Duration", nil];
    activitySettings = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:cardio,weight, nil] forKeys:activity_type];
    NSLog(@"key count   == %d", [activitySettings count]);
}


//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
     return [activitySettings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"basicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == 0){
        [cell.textLabel setText: [[activitySettings allKeys] objectAtIndex:0]];
    }
    else {
        [cell.textLabel setText: [[activitySettings allKeys] objectAtIndex:1]];
    }
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//    
//}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSLog(@"Row %d  in column %d selected ", indexPath.row, indexPath.section);
   
    //MoveSetPropertiesViewController *msp = [[[propertySetter instantiateInitialViewController] viewControllers] objectAtIndex:0];
    
    //MoveSetPropertiesViewController *msp = [propertySetter instantiateViewControllerWithIdentifier:@"MSPVC"];
   
    
    //MoveSetPropertiesViewController *msp = [[mspNav viewControllers] objectAtIndex:0];
    
    // id msp = [[propertySetter instantiateInitialViewController] viewControllers];
    
    // NSLog(@"vcs = %@",[msp description] );
    
    //[[msp objectAtIndex:0] setExerciseType:@"weight"];
    
//    if (indexPath.row == 0)
//      msp.exerciseType  = @"weight";
//    else
//         msp.exerciseType  = @"cardio";
//    
    if (indexPath.row == 1){
        UIStoryboard *propertySetter = [UIStoryboard storyboardWithName:@"propertySetter" bundle:[NSBundle mainBundle]];
        UINavigationController *mspNav = [propertySetter instantiateInitialViewController];
        [self presentViewController:mspNav animated:YES completion:nil];
    }
    else {
        UIStoryboard *propertySetter = [UIStoryboard storyboardWithName:@"NewWeightActivity" bundle:[NSBundle mainBundle]];
        UINavigationController *mspNav = [propertySetter instantiateInitialViewController];
        [self presentViewController:mspNav animated:YES completion:nil];

    }
    
    //[self.navigationController pushViewController:mspNav animated:YES];
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Workout type";
}

#pragma mark - textfield protocol
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = nil;
}

/**
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}
**/


#pragma - segue



- (IBAction)done:(UIStoryboardSegue *)segue {
    
        
        NSLog(@"Source VC == %@",[[[segue sourceViewController] activity] activity_name] );
        NSLog(@"Destination VC == %@",[[segue destinationViewController] description]);
        self.activity = [[segue sourceViewController] activity];
        
        //[self  dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    
    
    NSLog(@"Done clicked");
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
        
        //[self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"Cancel clicked");
}


@end
