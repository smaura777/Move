//
//  NewActivityVC.m
//  MovePrototype01
//
//  Created by samuel maura on 7/10/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "NewActivityVC.h"
#import "Activity.h"


@interface NewActivityVC ()
-(void)configureView;

@end

@implementation NewActivityVC

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
    [self configureView];
    self.activity = [[Activity alloc] initForCardioWithName:nil reps:nil sets:nil distance:nil speed:nil duration:nil];
    self.activity.activity_type = @"cardio";
    
    

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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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
}


#pragma mark - View config

-(void)configureView {
   _setsLabel.text = @"0";
   _repetitionLabel.text = @"0";
   _durationLabel.text = @"0";
   _distanceLabel.text = @"0";
    
}

- (IBAction)setsSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_setsLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ] ];
    self.activity.sets = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)repetitionSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_repetitionLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.reps = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)durationSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_durationLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.duration = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)distanceSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_distanceLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.distance = [NSString stringWithFormat:@"%d", (int)slider.value  ];
   
}

#pragma mark - NameLookupVCProtocol methods

-(void)selectedExecise:(Exercise *)exe{
    self.exercise = exe ;
    self.activity.activity_name  = _exercise.name;
    self.nameLabel.text = _exercise.name;
    
    
}

-(void)deselectedExecise:(Exercise *)exe {
    if ([[self.exercise exercise_id] isEqual:[exe exercise_id] ]){
        self.exercise = nil;
        self.activity.activity_name = nil;
    }
}


#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"openNameLookup"]){
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
