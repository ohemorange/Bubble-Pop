//
//  HelloWorldLayer.h
//  BubblePop
//
//  Created by Erica Portnoy on 3/21/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "RootViewController.h"


typedef enum Level {
    EASY,
    MEDIUM,
    HARD
} Level;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    NSMutableArray *_bubbles;
    int _bubblesDestroyed;
    RootViewController * _rootViewController;
    int _level;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) sceneWithLevel:(int)level rootViewController:(RootViewController *)rootViewController;
- (id)initWithLevel:(int)level rootViewController:(RootViewController *)rootViewController;



@end

