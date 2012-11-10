//
//  RootViewController.m
//  WP7Scroll
//
//  Created by 李伟 on 12-4-11.
//  Copyright 2012年 LiWei. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"^_^  ⊙﹏⊙b O(∩_∩)O~  ";
    label.textColor = [UIColor magentaColor];
    [self.view addSubview:label];
    [label release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
