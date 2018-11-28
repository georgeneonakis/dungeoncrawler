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
    srand((int)time(NULL));
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
    for (int i = 0; i < [grid count]; i++) {
        for (int j = 0; j < [grid[0] count]; j++) {
            [grid[i][j] tick];
            if ([grid[i][j] isDamage]) {
                [self.gridView changeColorOfTileAtX:i Y:j Color: [UIColor purpleColor]];
            }
            else if (((Tile*)self.grid[i][j]).object == nil) {
                [self.gridView changeColorOfTileAtX:i Y:j Color: [UIColor whiteColor]];
            }
        }
    }
}

-(void)updatePositionOfEntity:(Entity*)entity ByX:(int)x Y:(int)y {
    int prevX = [entity getXPosition];
    int prevY = [entity getYPosition];
    ((Tile*)self.grid[prevX][prevY]).object = nil;
    [self.gridView changeColorOfTileAtX:prevX Y:prevY Color:[UIColor whiteColor]];
    int currentX = prevX + x;
    int currentY = prevY + y;
    if (currentX < 0) {
        currentX = 0;
    }
    if (currentX >= [self.gridView getWidth]) {
        currentX = [self.gridView getWidth] - 1;
    }
    if (currentY < 0) {
        currentY = 0;
    }
    if (currentY >= [self.gridView getHeight]) {
        currentY = [self.gridView getHeight] - 1;
    }
    if (((Tile*)self.grid[currentX][currentY]).object != nil) {
        if ([((Tile*)self.grid[currentX][currentY]).object isKindOfClass:[Enemy class]]) {
            [self.player causeDamage:1];
        }
        currentX = prevX;
        currentY = prevY;
    }
    ((Tile*)self.grid[currentX][currentY]).object = entity;
    UIColor *entityColor = [UIColor blueColor];
    [self.gridView changeColorOfTileAtX:currentX Y:currentY Color:entityColor];
    [entity movePositionToX:currentX Y:currentY];
}

-(void)spawnEntities {
    self.player = [[Player alloc] initWithX:0 Y:0 Blocks:false Health:5];
    int playerX = [self.player getXPosition];
    int playerY = [self.player getYPosition];
    ((Tile*)self.grid[playerX][playerY]).object = self.player;
    UIColor *playerColor = [UIColor blueColor];
    [self.gridView changeColorOfTileAtX:playerX Y:playerY Color:playerColor];
    [self.entityManager addObject:self.player];
    self.player.entityIndex = [self.entityManager count] - 1;
    self.player.delegate = self;
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
        newEnemy.entityIndex = [self.entityManager count] - 1;
        newEnemy.delegate = self;
    }
}

#pragma delegate
-(void)applyAbility:(Ability *)a AtBaseX:(int)x BaseY:(int)y Direction:(int)direction{
    int (^xBlock)(int forward, int right, int xValue);
    int (^yBlock)(int forward, int right, int yValue);
    if (direction == 0) {
        xBlock = ^int(int forward, int right, int xValue) {
            return xValue + right;
        };
        yBlock = ^int(int forward, int right, int yValue) {
            return yValue - forward;
        };
    }
    else if (direction == 1) {
        xBlock = ^int(int forward, int right, int xValue) {
            return xValue + forward;
        };
        yBlock = ^int(int forward, int right, int yValue) {
            return yValue + right;
        };
    }
    else if (direction == 2) {
        xBlock = ^int(int forward, int right, int xValue) {
            return xValue - right;
        };
        yBlock = ^int(int forward, int right, int yValue) {
            return yValue + forward;
        };
    }
    else if (direction == 3){
        xBlock = ^int(int forward, int right, int xValue) {
            return xValue - forward;
        };
        yBlock = ^int(int forward, int right, int yValue) {
            return yValue - right;
        };
    }
    for (int i = 0; i < [a.shape count]; i++) {
        int forward = [a.shape[i][0] integerValue];
        int right = [a.shape[i][1] integerValue];
        int xAttack = xBlock(forward, right, x);
        int yAttack = yBlock(forward, right, y);
        if (xAttack < 0 || xAttack >= [self.gridView getWidth] || yAttack < 0 || yAttack >= [self.gridView getHeight]) {
            continue;
        }
        NSLog(@"Set damage of tile at x:%d, y:%d", xBlock(forward, right, x), yBlock(forward, right, y));
        [((Tile*)self.grid[xAttack][yAttack]) setDamageWithAmount:1 time:2 after:0];
    }
}

-(void)destroyEntityAtIndex:(int)index{
    Entity *dead = (Entity*)[self.entityManager objectAtIndex:index];
    [self.entityManager exchangeObjectAtIndex:index withObjectAtIndex:[self.entityManager count] - 1];
    ((Entity*)[self.entityManager objectAtIndex:index]).entityIndex = index;
    [self.gridView changeColorOfTileAtX:[dead getXPosition] Y:[dead getYPosition] Color: [UIColor whiteColor]];
    [self.entityManager removeLastObject];
}

@end
