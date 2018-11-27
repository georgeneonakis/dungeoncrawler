//
//  GameEngine.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

@synthesize player, grid, entityManager, gridView;

-(id)initWithGrid:(Grid*)g {
    self = [super init];
    self.gridView = g;
    srand(time(NULL));
    self.grid = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        self.grid[i] = [[NSMutableArray alloc] initWithObjects:
                        [[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],[[Tile alloc] init],nil];
    }
    self.entityManager = [[NSMutableArray alloc] initWithCapacity:10];
    [self spawnEntities];
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
    UIColor *entityColor = [UIColor redColor];
    [self.gridView changeColorOfTileAtX:currentX Y:currentY Color:entityColor];
    [entity movePositionByX:x Y:y];
}

-(void)spawnEntities {
    self.player = [[Player alloc] initWithX:0 Y:0 Blocks:false Health:5];
    int playerX = [self.player getXPosition];
    int playerY = [self.player getYPosition];
    ((Tile*)self.grid[playerX][playerY]).object = self.player;
    UIColor *playerColor = [UIColor blueColor];
    [self.gridView changeColorOfTileAtX:playerX Y:playerY Color:playerColor];
    [self.entityManager addObject:self.player];
    for (int i = 0; i < 3; i++) {
        int currentX = rand() % 5;
        int currentY = rand() % 5;
        while (((Tile*)self.grid[currentX][currentY]).object != nil) {
            currentX = rand() % 5;
            currentY = rand() % 5;
        }
        Enemy *newEnemy = [[Enemy alloc] initWithX:currentX Y:currentY Blocks:false Health:1];
        ((Tile*)self.grid[currentX][currentY]).object = newEnemy;
        UIColor *enemyColor = [UIColor redColor];
        [self.gridView changeColorOfTileAtX:currentX Y:currentY Color:enemyColor];
        [self.entityManager addObject:newEnemy];
    }
}

@end
