//
//  HelloWorldLayer.m
//  BubblePop
//
//  Created by Erica Portnoy on 3/21/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "GameOverScene.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) sceneWithLevel:(int)level rootViewController:(RootViewController *)rootViewController
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [[[HelloWorldLayer alloc] 
                               initWithLevel:level rootViewController:rootViewController] autorelease];;
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
- (id)initWithLevel:(int)level rootViewController:(RootViewController *)rootViewController
{
	if( (self=[super initWithColor:ccc4(79,148,97,255)] )) {
        //CGSize winSize = [[CCDirector sharedDirector] winSize];
        [self schedule:@selector(gameLogic:) interval:0.5];
		self.isTouchEnabled = YES;
        _rootViewController = rootViewController;
        _level = level;
        _bubbles = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == 1) { // bubble
        [_bubbles removeObject:sprite];
        GameOverScene *gameOverScene = [GameOverScene node];
        [gameOverScene.layer.label setString:@"You Lose :["];
        gameOverScene.layer.rootViewController = _rootViewController;
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
    [self removeChild:sprite cleanup:YES];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    NSMutableArray *bubblesToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *bubble in _bubbles) {
        CGRect targetRect = CGRectMake(
                                       bubble.position.x - (bubble.contentSize.width/2), 
                                       bubble.position.y - (bubble.contentSize.height/2), 
                                       bubble.contentSize.width, 
                                       bubble.contentSize.height);
        
        if (CGRectContainsPoint(targetRect, location)) {
            [bubblesToDelete addObject:bubble];				
        }						
    }
            
    for (CCSprite *bubble in bubblesToDelete) {
        [_bubbles removeObject:bubble];
        [self removeChild:bubble cleanup:YES];	
        _bubblesDestroyed++;
        if (_bubblesDestroyed > 20) {
            GameOverScene *gameOverScene = [GameOverScene node];
            _bubblesDestroyed = 0;
            [gameOverScene.layer.label setString:@"You Win!"];
            gameOverScene.layer.rootViewController = _rootViewController;
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
    }
    
    [bubblesToDelete release];

}

-(void)addBubble {
    
    CCSprite *bubble = [CCSprite spriteWithFile:@"bubble.gif"]; 
    
    // Determine where to spawn the target along the x axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minX = bubble.contentSize.width/2;
    int maxX = winSize.width - bubble.contentSize.width/2;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;
    
    // Create the target slightly off-screen along the bottom edge,
    // and along a random position along the X axis as calculated above
    bubble.position = ccp(actualX, (bubble.contentSize.height/2));
    [self addChild:bubble];
    
    // Determine speed of the target
    int minDuration = 2.0 - _level * 0.5;
    int maxDuration = 4.0 - _level;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    id actionMove = [CCMoveTo actionWithDuration:actualDuration 
                                        position:ccp(actualX, winSize.height + bubble.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self 
                                             selector:@selector(spriteMoveFinished:)];
    [bubble runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    
    bubble.tag = 1;
    [_bubbles addObject:bubble];
    
}

-(void)gameLogic:(ccTime)dt {
    [self addBubble];
}

// release all  retained objects
- (void) dealloc
{
    [_bubbles release];
    _bubbles = nil;
    [_rootViewController release];
    _rootViewController = nil;
	
	[super dealloc];
}
@end
