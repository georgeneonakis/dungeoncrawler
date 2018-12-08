//
//  Tile.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize object;

-(id)init {
    self = [super init];
    return self;
}

-(bool)isDamage {
    return isDamaging;
}

-(void)setDamageWithAmount:(int)amount time:(int)time {
    damageAmount = amount;
    damageTime = time;
    isDamaging = true;
}

-(void)causeDamage {
    [object causeDamage:damageAmount];
}

@end
