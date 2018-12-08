//
//  Entity.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize health,markedForDeath, direction, entityIndex;

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)block Image:(NSString *)imageName Health:(int)hp {
    self = [super initWithX:x Y:y Blocks:blocks Image: imageName];
    self.health = hp;
    self.direction = 2;
    return self;
}

-(void)causeDamage:(int)amount {
    self.health -= amount;
    if (self.health < 0) {
        self.markedForDeath = true;
    }
}

-(void)movePositionToX:(int)x Y:(int)y {
    xPos = x;
    yPos = y;
}

-(void)performAbility:(int)index {
    [self.delegate applyAbility:self.abilities[index] AtBaseX:xPos BaseY:yPos Direction:self.direction];
}

@end
