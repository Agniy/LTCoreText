//
//  OptionViewController.m
//  LTCoreText
//
//  Created by 伊藤 祐輔 on 12/01/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OptionViewController.h"

@implementation OptionViewController
@synthesize pColVText;
@synthesize pColVLayout;
@synthesize lColVText;
@synthesize lColVLayout;

@synthesize pColLabel;
@synthesize lColLabel;

- (id)init
{
    self = [super initWithNibName:@"OptionViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)_updateUI
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    self.lColLabel.text = [NSString stringWithFormat:@"%d", [defaults integerForKey:@"lCol"]];
    
    self.lColVText.on = [defaults boolForKey:@"lColVText"];
    self.lColVLayout.on = [defaults boolForKey:@"lColVLayout"];
    
    self.pColLabel.text = [NSString stringWithFormat:@"%d", [defaults integerForKey:@"pCol"]];
    
    self.pColVText.on = [defaults boolForKey:@"pColVText"];
    self.pColVLayout.on = [defaults boolForKey:@"pColVLayout"];
}

- (void)viewDidLoad
{
    
    [self _updateUI];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLColLabel:nil];
    [self setLColVText:nil];
    [self setLColVLayout:nil];
    [self setPColLabel:nil];
    [self setPColVText:nil];
    [self setPColVLayout:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)lColStepChanged:(UIStepper*)sender
{
    [[NSUserDefaults standardUserDefaults] setInteger:sender.value forKey:@"lCol"];
    [self _updateUI];
}
- (IBAction)lColVTextChagned:(UISwitch*)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"lColVText"];
    [self _updateUI];
}

- (IBAction)lColVLayoutChanged:(UISwitch*)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"lColVLayout"];
    [self _updateUI];
}

- (IBAction)pColStepChanged:(UIStepper*)sender
{
    [[NSUserDefaults standardUserDefaults] setInteger:sender.value forKey:@"pCol"];
    [self _updateUI];
}
- (IBAction)pColVTextChanged:(UISwitch*)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"pColVText"];
    [self _updateUI];
}

- (IBAction)pColVLayoutChanged:(UISwitch*)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"pColVLayout"];
    [self _updateUI];
}
@end
