//
//  GameEngine.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

@synthesize player, grid, entityManager;

-(id)init {
    self = [super init];
    self.grid = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        self.grid[i] = [[NSMutableArray alloc] initWithObjects:
                        [[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],nil];
    }
    self.entityManager = [[NSMutableArray alloc] initWithCapacity:10];
    [self spawnEntities];
    for (int i = 0; i < [self.entityManager count]; i++) {
        NSLog(@"%d, %d", [self.entityManager[i] getXPosition], [self.entityManager[i] getXPosition]);
    }
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

-(void)spawnEntities {
    self.player = [[Player alloc] initWithX:0 Y:0 Blocks:false Health:5];
    int playerX = [self.player getXPosition];
    int playerY = [self.player getYPosition];
    ((Tile*)self.grid[playerX][playerY]).object = self.player;
    [self.entityManager addObject:self.player];
    for (int i = 0; i < 3; i++) {
        int currentX = arc4random_uniform(5);
        int currentY = arc4random_uniform(5);
        while (((Tile*)self.grid[currentX][currentY]).object != nil) {
            currentX = arc4random_uniform(5);
            currentY = arc4random_uniform(5);
        }
        Enemy *newEnemy = [[Enemy alloc] initWithX:currentX Y:currentY Blocks:false Health:1];
        ((Tile*)self.grid[currentX][currentY]).object = newEnemy;
        [self.entityManager addObject:newEnemy];
    }
}

@end
