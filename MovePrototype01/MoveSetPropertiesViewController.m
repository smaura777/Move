//
//  MoveSetPropertiesViewController.m
//  MovePrototype01
//
//  Created by Maura, Sam on 6/28/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "MoveSetPropertiesViewController.h"
#import "SliderCell.h"


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
    
    //[tableView registerNib:[UINib nibWithNibName:CellIdentifier bundle:nil] forCellReuseIdentifier:CellIdentifier];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SliderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"sliderCell"];
    //[self.tableView setBackgroundView:<#(UIView *)#>];
    
    if ([self.exerciseType isEqualToString:@"weight"]){
        self.weightTrainingProperties = [NSArray
                                        arrayWithObjects:@[@"name"],@[@"reps",@"sets"],@[@"Duration"], nil];
        
        _dataKey = [NSArray arrayWithObjects:@"Exercise Name",@"Reps & Sets",@"Duration", nil];
        
        
        
        NSArray *weightSet = [NSArray arrayWithObjects:
                              [NSDictionary dictionaryWithObject:
                               
                               [NSArray arrayWithObjects:
                                    [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"",@"basic", nil]
                                                forKeys: [NSArray arrayWithObjects:@"name", @"cell_type",nil] ],
                                nil]
                               forKey:@"Exercise Name"],
                              
                              [NSDictionary dictionaryWithObject:
                               [NSArray arrayWithObjects:
                                
                                [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"reps",@"0",@"slider", nil] forKeys:[NSArray arrayWithObjects:@"unit",@"value",@"cell_type" ,nil] ],
                                
                                [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"sets",@"0",@"slider", nil] forKeys:[NSArray arrayWithObjects:@"unit",@"value",@"cell_type", nil] ],
                                
                                nil]
                               forKey:@"Reps and Sets"],
                              
                              
                              [NSDictionary dictionaryWithObject:
                               [NSArray arrayWithObjects:
                                [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"minutes",@"0",@"slider", nil] forKeys:[NSArray arrayWithObjects:@"unit",@"value",@"cell_type", nil] ],
                                
                                nil]
                             forKey:@"Duration"],
                              
                              
                              nil];

        
        
        //_data = _weightTrainingProperties;
        _data = weightSet;
        
        
    }
    
    if ([self.exerciseType isEqualToString:@"cardio"]){
        _dataKey = [NSArray arrayWithObjects:@"Exercise Name",@"Reps & Sets",@"Duration", nil];
        self.cardioTrainingProperties = [NSArray
                                        arrayWithObjects:@[@"Select exercise"],@[@"reps",@"sets"],@[@"distance",@"speed",@"Duration"], nil];
        
        
                
        
         _data = _cardioTrainingProperties;
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma 
#pragma - Table View methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 46.0;
    
    if (indexPath.section > 0){
        height = 156.0;
    }

   return height;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [_dataKey count];
    return [_data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return  [[_data objectAtIndex:section] count];
    
    NSString *sectionKey = [[ [_data objectAtIndex:section] allKeys] lastObject ];
    return  [[[_data objectAtIndex:section] objectForKey:sectionKey] count];
    // return  [[_data objectAtIndex:section] count  ];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"propDetail";
    static NSString *CustomIdentifier = @"sliderCell";
    UITableViewCell *anyCell = nil;
    
    
    /**
    if ( [[[[[[_data objectAtIndex:indexPath.section] allValues] lastObject] objectAtIndex:indexPath.row] objectForKey:@"cell_type"] isEqual:@"slider"]  ){
        
    }
     
    **/ 
    
    /// if (indexPath.section > 0){
    
    if ( [[[[[[_data objectAtIndex:indexPath.section] allValues] lastObject] objectAtIndex:indexPath.row] objectForKey:@"cell_type"] isEqual:@"slider"]  ){
    
        SliderCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomIdentifier];
        
        if (!cell){
            //cell = [[SliderCell alloc] init];
        }
        
        
        /**
        [cell.measure setText: [[_data objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row] ];
        if (indexPath.section == 1 && indexPath.row == 0 )
            [cell.unit setText:@"Reps" ];
        
        else if (indexPath.section == 1 && indexPath.row == 1 )
             [cell.unit setText:@"Sets" ];
        
        else if (indexPath.section == 2 && indexPath.row == 0 )
            [cell.unit setText:@"Miles" ];
        **/
        
        [cell.measure setText: [[[[[_data objectAtIndex:indexPath.section] allValues] lastObject] objectAtIndex:indexPath.row] objectForKey:@"value"]   ];
        [cell.unit setText: [[[[[_data objectAtIndex:indexPath.section] allValues] lastObject] objectAtIndex:indexPath.row] objectForKey:@"unit"]  ];
        
        anyCell = cell;
        
    }
    else {
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
      
        //[[cell textLabel] setText: [[_data objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row] ];
        [[cell textLabel] setText:@"reg"];
        
        anyCell = cell;
     
    }
    
    return anyCell;
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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[[_data objectAtIndex:section] allKeys] lastObject];
}

@end
