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
    self.isFriendly = false;
    return self;
}

-(bool)isDamage {
    return self.isDamaging;
}

-(void)setDamageWithAmount:(int)amount time:(int)time after:(int)delay friendly:(bool)friendly {
    self.damageDelay = delay;
    self.damageAmount = amount;
    self.damageTime = time;
    self.isFriendly = friendly;
    if (delay != 0) {
        self.isDelayed = true;
    }
    else {
        self.isDamaging = true;
    }
}

-(void)causeDamage {
    if ([object isKindOfClass:[Entity class]]) {
        if ((self.isFriendly && [object isKindOfClass:[Enemy class]]) || (!self.isFriendly && [object isKindOfClass:[Player class]])) {
            [(Entity*)object causeDamage:self.damageAmount];
        }
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
    if (self.isDamaging) {
        [self causeDamage];
        if (self.damageTime == 0) {
            self.isDamaging = false;
            self.damageAmount = 0;
        }
        self.damageTime--;
        if(self.damageTime < 0 )    { self.damageTime = 0; }
    }
}

@end
