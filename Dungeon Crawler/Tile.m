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
    self.isDamaging = false;
    self.isDelayed = false;
    return self;
}

-(bool)isDamage {
    return self.isDamaging;
}

-(void)setDamageWithAmount:(int)amount time:(int)time after:(int)delay {
    self.damageDelay = delay;
    self.damageAmount = amount;
    self.damageTime = time;
    if (delay != 0) {
        self.isDelayed = true;
    }
    else {
        self.isDamaging = true;
    }
}

-(void)causeDamage {
    if ([object isKindOfClass:[Entity class]]) {
        [(Entity*)object causeDamage:self.damageAmount];
    }
}

-(void)tick {
    if (self.isDelayed) {
        if (self.damageDelay == 0) {
            self.isDelayed = false;
            self.isDamaging = true;
        }
        self.damageDelay--;
    }
    else if (self.isDamaging) {
        [self causeDamage];
        self.damageTime--;
        if (self.damageTime == 0) {
            self.isDamaging = false;
            self.damageAmount = 0;
        }
    }
}

@end
