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
    if ([object isKindOfClass:[Entity class]]) {
        [(Entity*)object causeDamage:damageAmount];
    }
}

-(void)tick {
    if (isDamaging) {
        [self causeDamage];
        damageTime--;
        if (damageTime == 0) {
            isDamaging = false;
            damageAmount = 0;
        }
    }
}

@end
