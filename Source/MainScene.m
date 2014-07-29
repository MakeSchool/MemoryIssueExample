//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene  {
    NSMutableArray *_objects;
    NSData *_data;
}

- (void)onEnter {
    [super onEnter];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"txt"];
    _data = [NSData dataWithContentsOfFile:filePath];
    
    [self schedule:@selector(spawnObject) interval:0.1f];
}

- (void)spawnObject {
    CGFloat randomX = arc4random_uniform(self.contentSizeInPoints.width);
    CGFloat randomY = arc4random_uniform(self.contentSizeInPoints.height);
    
    Star *object = (Star *) [CCBReader load:@"Object"];
    object.mainScene = self;
    object.zOrder = -1;
    
    [self addChild:object];
    object.position = ccp(randomX, randomY);
}

- (void)restart {
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MainScene"]];
}

@end
