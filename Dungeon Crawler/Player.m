//
//  Player.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize gvc;

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp {
    self = [super initWithX:x Y:y Blocks:blocks Health:hp];
    self.abilities = [[NSMutableArray alloc] init];
    NSMutableArray *point = [[NSMutableArray alloc] init];
    [point addObject:@(2)];
    [point addObject:@(0)];
    NSMutableArray *point2 = [[NSMutableArray alloc] init];
    [point2 addObject:@(2)];
    [point2 addObject:@(-1)];
    NSMutableArray *point3 = [[NSMutableArray alloc] init];
    [point3 addObject:@(2)];
    [point3 addObject:@(1)];
    NSMutableArray *points = [[NSMutableArray alloc] initWithObjects:point, point2, point3, nil];
    Ability *attack = [[Ability alloc] initWithPoints:points];
    [self.abilities addObject:attack];
    return self;
}

-(void)causeDamage:(int)amount {
    [super causeDamage:amount];
    [gvc playerTakeDamage:amount];
}

@end
