//
//  MoveSetPropertiesViewController.m
//  MovePrototype01
//
//  Created by Maura, Sam on 6/28/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveSetPropertiesViewController.h"

@interface MoveSetPropertiesViewController ()

@end

@implementation MoveSetPropertiesViewController


- (void)awakeFromNib
{
    [super awakeFromNib];
    
}



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)updateProperty:(id)sender {
//    UISlider *slide = sender;
//    
//    NSLog(@"Value changed : %f ", slide.value);
//    self.propertyValue.text = [[NSNumber numberWithInt:(int)slide.value] stringValue];
//    
//}


#pragma 
#pragma - Table View methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"propDetail";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    [[cell textLabel] setText:@"My label"];
    
    [[cell detailTextLabel] setText:@"my detail"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
