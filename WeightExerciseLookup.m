//
//  WeightExerciseLookup.m
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "WeightExerciseLookup.h"
#import "Exercise.h"


@interface WeightExerciseLookup () {
 NSUInteger cellSelected;
 NSIndexPath *lastIndex;
 NSArray *exerciseList;
}

@end

@implementation WeightExerciseLookup

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    exerciseList = [NSArray arrayWithObjects:
                    [ [Exercise alloc] initWithName:@"Bench Press"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"001"],
                    
                    [ [Exercise alloc] initWithName:@"Shoulder press"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"002"],
                    
                    [ [Exercise alloc] initWithName:@"Leg press"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"003"],
                
                    [ [Exercise alloc] initWithName:@"Pectoral fly"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"004"],
                    
                    [ [Exercise alloc] initWithName:@"Pull down"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"005"],
                    
                    [ [Exercise alloc] initWithName:@"Pull ups"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"006"],
                    
                    [ [Exercise alloc] initWithName:@"Shoulder squat"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"007"],
                    
                    [ [Exercise alloc] initWithName:@"Dead lift"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"008"],

                    
                    [ [Exercise alloc] initWithName:@"Arm curls"
                                        Description:@"weight lift exercise" Category:@"weight"
                                              Image:nil ID:@"009"],

                    
                    
                    nil];

    
    
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
     return [exerciseList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WeightnameLokup";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Exercise *item = [exerciseList objectAtIndex:indexPath.row];
    cell.textLabel.text = [item name];
    cell.detailTextLabel.text = [item description];
    
    
    // Configure the cell...
    
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
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
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ( selectedCell.accessoryType == UITableViewCellAccessoryCheckmark){
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        if ([_delegate conformsToProtocol:@protocol(WeightExerciseLookupProtocol)]){
            [_delegate deselectedWeightExecise:[exerciseList objectAtIndex:indexPath.row]];
        }
        lastIndex = nil;
    }
    else {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        if ([_delegate conformsToProtocol:@protocol(WeightExerciseLookupProtocol)]){
            [_delegate selectedWeightExecise:[exerciseList objectAtIndex:indexPath.row]];
        }
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastIndex];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndex = indexPath;
    }
    
    
    NSLog(@"Selected row %d ", indexPath.row);

}

@end
