//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Enemy.h"
#import "Tile.h"
#import "Grid.h"

@interface GameEngine : NSObject<EntityDelegate>

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) NSMutableArray *grid;
@property (strong, nonatomic) NSMutableArray *entityManager;
@property (weak, nonatomic) Grid *gridView;
@property int level;
@property int maxLevel;

-(id)initWithGrid:(Grid*)g;
-(void)nextFrame;
-(void)updatePositionOfEntity:(Entity*)entity ByX:(int)x Y:(int)y;
-(void)spawnObject:(int)index atX:(int)x Y:(int)y;
-(void)applyAbility:(Ability *)a AtBaseX:(int)x BaseY:(int)y Direction:(int)direction;
-(void)loadLevel:(int)level;

@end
