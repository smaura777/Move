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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (IBAction)updateProperty:(id)sender {
    UISlider *slide = sender;
    
    NSLog(@"Value changed : %f ", slide.value);
    self.propertyValue.text = [[NSNumber numberWithInt:(int)slide.value] stringValue];
    
}

@end
