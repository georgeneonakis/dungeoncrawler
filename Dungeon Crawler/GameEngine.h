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

@interface GameEngine : NSObject

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) NSMutableArray *grid;
@property (strong, nonatomic) NSMutableArray *entityManager;

-(id)init;
-(void)nextFrame;
-(void)updatePositionOfEntity:(Entity*)entity ByX:(int)x Y:(int)y;
-(void)spawnEntities;

@end
