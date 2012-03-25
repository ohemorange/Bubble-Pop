//
//  GameOverScene.h
//  SimpleGame
//
//  Created by Erica Portnoy on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "RootViewController.h"

@interface GameOverLayer : CCLayerColor {
    CCLabelTTF *_label;
    RootViewController * _rootViewController;
}
@property (nonatomic, retain) CCLabelTTF *label;
@property (nonatomic, retain) RootViewController *rootViewController;
@end

@interface GameOverScene : CCScene {
    GameOverLayer *_layer;
}
@property (nonatomic, retain) GameOverLayer *layer;
@end
