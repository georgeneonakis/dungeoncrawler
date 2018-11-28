//
//  Entity.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize health, direction, entityIndex;

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp {
    self = [super initWithX:x Y:y Blocks:blocks];
    self.health = hp;
    self.direction = 2;
    return self;
}

-(void)causeDamage:(int)amount {
    self.health -= amount;
    if (self.health < 0) {
        self.health = 0;
    }
}

-(void)movePositionToX:(int)x Y:(int)y {
    xPos = x;
    yPos = y;
}

-(void)attack {
    [self.delegate applyAbility:self.abilities[0] AtBaseX:xPos BaseY:yPos Direction:self.direction];
}

@end
