//
//  RootViewController.h
//  BubblePop
//
//  Created by Erica Portnoy on 3/21/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController {
    int _level;
}

@property int level;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil initWithLevel:(int)level;

@end
