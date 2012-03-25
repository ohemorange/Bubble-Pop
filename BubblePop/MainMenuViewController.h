//
//  MainMenuViewController.h
//  BubblePop
//
//  Created by Erica Portnoy on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface MainMenuViewController : UIViewController {
    //RootViewController *_rootViewController;
}

//@property (retain) RootViewController *rootViewController;

- (IBAction)viewTapped:(id)sender;
- (IBAction)easyTapped:(id)sender;
- (IBAction)mediumTapped:(id)sender;

@end