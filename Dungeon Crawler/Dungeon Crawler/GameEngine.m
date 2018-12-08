//
//  GameEngine.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

@synthesize player, grid;

-(id)init {
    self = [super init];
    self.player = [[Player alloc] initWithHealth:5 xPos:1 yPos:1];
    self.grid = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        self.grid[i] = [[NSMutableArray alloc] initWithObjects:
                        [[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],nil];
    }
    int playerX = [self.player getXPosition];
    int playerY = [self.player getYPosition];
    ((Tile*)self.grid[playerX][playerY]).object = self.player;
    return self;
}

-(void)nextFrame {
    
}

-(void)updatePositionOfEntity:(Entity*)entity ByX:(int)x Y:(int)y {
    int currentX = [entity getXPosition];
    int currentY = [entity getYPosition];
    ((Tile*)self.grid[currentX][currentY]).object = nil;
    currentX += x;
    currentY += y;
    ((Tile*)self.grid[currentX][currentY]).object = entity;
    [entity movePositionByX:x Y:y];
}

@end
