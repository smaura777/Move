//
//  MoveMasterViewController.m
//  MovePrototype01
//
//  Created by samuel maura on 6/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveMasterViewController.h"

#import "MoveDetailViewController.h"
#import "MoveCreateViewController.h"
#import "ActivityDataController.h"
#import "Activity.h"


//
//@interface MoveMasterViewController () {
//    NSMutableArray *_objects;
//}
//@end

@implementation MoveMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.activityDataController = [ActivityDataController sharedInstance];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem.accessibilityHint = @"Add new activity";

//   UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"UpdatedActivityNotification" object:nil queue:nil usingBlock:^(NSNotification *note) {
        
        NSLog(@"Received list update notification");
        
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)insertNewObject:(id)sender
{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Activity count: %d ", [self.activityDataController countOfList]);
    
    return [self.activityDataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"activityCell";
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    Activity   *activityIndex = [self.activityDataController objectInListAtIndex:indexPath.row];
    
    [[cell textLabel] setText:activityIndex.activity_name];
    
    [[cell detailTextLabel] setText:activityIndex.activity_type];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.activityDataController removeActivityAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showActivityDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //  Activity   *activityIndex = [self.activityDataController objectInListAtIndex:indexPath.row];
        [[segue destinationViewController] setActivityIndex:indexPath.row];
         [[segue destinationViewController] setParent:self.tableView];
        
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]){
        MoveCreateViewController *created = [segue sourceViewController];
        if (created.activity){
            [self.activityDataController addActivityLog:created.activity];
                //[self.tableView reloadData];
        }

       [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"CancelInput"]){
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


@end
