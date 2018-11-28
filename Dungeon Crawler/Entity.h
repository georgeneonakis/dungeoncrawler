//
//  Entity.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameObject.h"
#import "Ability.h"

@protocol EntityDelegate<NSObject>

-(void)applyAbility:(Ability*)a AtBaseX:(int)x BaseY:(int)y Direction:(int)direction;
-(void)destroyEntityAtIndex:(int)index;

@end

@interface Entity : GameObject

@property id<EntityDelegate> delegate;
@property int health;
@property int direction;
@property int entityIndex;
@property (strong, nonatomic) NSMutableArray *abilities;


-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp;
-(void)causeDamage:(int)amount;
-(void)movePositionToX:(int)x Y:(int)y;
-(void)attack;

@end
