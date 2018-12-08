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
    self.grid = [[NSMutableArray alloc] initWithCapacity: [self.gridView.tiles count]];
    for (int i = 0; i < [self.gridView.tiles count]; i++) {
        self.grid[i] = [[NSMutableArray alloc] initWithCapacity: [self.gridView.tiles count]];
        for( int j = 0; j < [self.gridView.tiles[0] count]; j++ )
        {
            [self.grid[i] addObject:[[Tile alloc] init]];
        }
    }
    self.entityManager = [[NSMutableArray alloc] initWithCapacity:10];
    self.player = [[Player alloc] initWithX:0 Y:0 Blocks:false Health:5];
    int playerX = [self.player getXPosition];
    int playerY = [self.player getYPosition];
    ((Tile*)self.grid[playerX][playerY]).object = self.player;
    [((TileView*)self.gridView.tiles[playerY][playerX]) addSubview: self.player.objectImageView];
    [self.entityManager addObject:self.player];
    self.player.entityIndex = [self.entityManager count] - 1;
    self.player.delegate = self;
    self.enemyCount = 2;
    [self spawnEntities:self.enemyCount];
    return self;
}

-(void)nextFrame {
    if ([self.entityManager count] <= 1) {
        self.enemyCount += 1;
        [self spawnEntities:self.enemyCount];
        [self.player causeDamage:(self.player.health - 5)];
        return;
    }
    for (int i = 0; i < [grid count]; i++) {
        for (int j = 0; j < [grid[0] count]; j++) {
            [grid[i][j] tick];
            if ([grid[i][j] isDamage]) {
                [self.gridView addEffectLayerAtX:i Y:j Color: [UIColor redColor]];
            }
            else if([grid[i][j] isDelayed])
            {
                [self.gridView addEffectLayerAtX:i Y:j Color: [UIColor purpleColor]];
            }
            else {
                [self.gridView stopEffectAtX:i Y:j];
            }
        }
    }
    for( Entity *entity in self.entityManager )
    {
        if( [entity isKindOfClass:[Player class]])  { continue; }
        int val = rand() % 101;
        if( val < 50 )
        {
            int moveX = 0;
            int moveY = 0;
            val = rand() % 4;
            switch ( val ) {
                case 0:
                    moveX = 0;
                    moveY = -1;
                    break;
                case 1:
                    moveX = 1;
                    moveY = 0;
                    break;
                case 2:
                    moveX = 0;
                    moveY = 1;
                    break;
                case 3:
                    moveX = -1;
                    moveY = 0;
                    break;
                default:
                    break;
            }
            
            [self updatePositionOfEntity:entity ByX:moveX Y:moveY];
        }
    }
    for( Entity *entity in self.entityManager )
    {
        if( entity.markedForDeath )  {
            [self destroyEntityAtIndex:entity.entityIndex];
        }
    }
}

-(void)updatePositionOfEntity:(Entity*)entity ByX:(int)x Y:(int)y {
    int prevX = [entity getXPosition];
    int prevY = [entity getYPosition];
    [((Tile*)self.grid[prevX][prevY]).object.objectImageView removeFromSuperview];
    ((Tile*)self.grid[prevX][prevY]).object = nil;
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
            if( [entity isKindOfClass:[Player class]])
            {
                [entity causeDamage:1];
            }
        }
        currentX = prevX;
        currentY = prevY;
    }
    ((Tile*)self.grid[currentX][currentY]).object = entity;
    [((TileView*)self.gridView.tiles[currentY][currentX]) addSubview: entity.objectImageView];
    [entity movePositionToX:currentX Y:currentY];
}

-(void)spawnEntities:(int)number {
    for (int i = 0; i < number; i++) {
        int currentX = rand() % 5;
        int currentY = rand() % 5;
        while (((Tile*)self.grid[currentX][currentY]).object != nil) {
            currentX = rand() % 5;
            currentY = rand() % 5;
        }
        Enemy *newEnemy = [[Enemy alloc] initWithX:currentX Y:currentY Blocks:false Image:@"Slime_Enemy_Sprite0.png" Health:1];
        ((Tile*)self.grid[currentX][currentY]).object = newEnemy;
        [((TileView*)self.gridView.tiles[currentY][currentX]) addSubview: newEnemy.objectImageView];
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
        [((Tile*)self.grid[xAttack][yAttack]) setDamageWithAmount:1 time:a.time after:a.delay friendly:true];
    }
}

-(void)destroyEntityAtIndex:(int)index{
    Entity *dead = (Entity*)[self.entityManager objectAtIndex:index];
    [((Tile*)self.grid[[dead getXPosition]][[dead getYPosition]]).object.objectImageView removeFromSuperview];
    [self.entityManager exchangeObjectAtIndex:index withObjectAtIndex:[self.entityManager count] - 1];
    ((Entity*)[self.entityManager objectAtIndex:index]).entityIndex = index;
    [self.entityManager removeLastObject];
}

@end
