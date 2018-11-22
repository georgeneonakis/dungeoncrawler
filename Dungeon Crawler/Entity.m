//
//  Entity.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "Entity.h"

@implementation Entity

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp {
    self = [super initWithX:x Y:y Blocks:blocks];
    health = hp;
    return self;
}

-(void)causeDamage:(int)amount {
    health -= amount;
}

-(void)movePositionByX:(int)x Y:(int)y {
    xPos += x;
    yPos += y;
}

@end
