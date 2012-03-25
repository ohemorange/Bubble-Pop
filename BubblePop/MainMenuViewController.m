//
//  MainMenuViewController.m
//  BubblePop
//
//  Created by Erica Portnoy on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"


@implementation MainMenuViewController

//@synthesize rootViewController = _rootViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)startLevel:(id)arg withLevel:(int)level {
//    if (_rootViewController == nil) {
//        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil initWithLevel:level] autorelease];
//    }
//    else {
//        self.rootViewController.level = level;
//    }
    RootViewController *rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil initWithLevel:level] autorelease];
    [self.navigationController pushViewController:rootViewController animated:YES];
}

- (IBAction)viewTapped:(id)sender {
    [self startLevel:nil withLevel:2];
}

- (IBAction)easyTapped:(id)sender {
    [self startLevel:nil withLevel:0];
}

- (IBAction)mediumTapped:(id)sender {
    [self startLevel:nil withLevel:1];
}

- (void)dealloc
{
//    [_rootViewController release];
//    _rootViewController = nil;
    [super dealloc];
}
@end
