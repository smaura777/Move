//
//  NewWeightActivity.m
//  MovePrototype01
//
//  Created by samuel maura on 7/13/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "NewWeightActivity.h"

@interface NewWeightActivity ()

@end

@implementation NewWeightActivity

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
    self.activity = [[Activity alloc] init];
    self.activity.activity_type = @"weight";
    

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
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
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

- (IBAction)setsSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_setsLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ] ];
    self.activity.sets = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)repetitionSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_repetitionsLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.reps = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)durationSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_durationLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.duration = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}

- (IBAction)weightSliderChanged:(id)sender {
    UISlider *slider = sender;
    
    [_weightLabel setText:[NSString stringWithFormat:@"%d", (int)slider.value  ]];
    self.activity.weight = [NSString stringWithFormat:@"%d", (int)slider.value  ];
}



-(void)configureView {
    
    _setsLabel.text = @"0";
    _repetitionsLabel.text = @"0";
    _durationLabel.text = @"0";
    _weightLabel.text = @"0";
}

#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"openWeightNameLookup"]){
        [[segue destinationViewController] setDelegate:self];
    }
}


#pragma mark - Protocol weightname lookup

-(void)selectedWeightExecise:(Exercise *)exe {
    self.exercise = exe ;
    self.activity.activity_name  = _exercise.name;
    self.nameLabel.text = _exercise.name;

}

-(void)deselectedWeightExecise:(Exercise *)exe {
    if ([[self.exercise exercise_id] isEqual:[exe exercise_id] ]){
        self.exercise = nil;
        self.activity.activity_name = nil;
    }
}


@end
