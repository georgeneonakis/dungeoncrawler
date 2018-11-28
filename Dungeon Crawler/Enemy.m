//
//  Enemy.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-22.
//  Copyright © 2018 George. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

-(void)causeDamage:(int)amount {
    [super causeDamage:amount];
    if (self.health == 0) {
        NSLog(@"I'm dead");
        [self.delegate destroyEntityAtIndex:self.entityIndex];
    }
}

@end
