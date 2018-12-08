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
    self = [super initWithX:x Y:y Blocks:blocks Image: @"Player_Sprite0.png" Health:hp];
    self.abilities = [[NSMutableArray alloc] init];
    
    NSMutableArray *point = [[NSMutableArray alloc] init];
    NSMutableArray *point2 = [[NSMutableArray alloc] init];
    NSMutableArray *point3 = [[NSMutableArray alloc] init];
    NSMutableArray *point4 = [[NSMutableArray alloc] init];
    NSMutableArray *point5 = [[NSMutableArray alloc] init];
    NSMutableArray *point6 = [[NSMutableArray alloc] init];
    NSMutableArray *point7 = [[NSMutableArray alloc] init];
    NSMutableArray *point8 = [[NSMutableArray alloc] init];
    
    //0 - 3 in front
    point = [[NSMutableArray alloc] init];
    [point addObject:@(1)];
    [point addObject:@(0)];
    point2 = [[NSMutableArray alloc] init];
    [point2 addObject:@(1)];
    [point2 addObject:@(-1)];
    point3 = [[NSMutableArray alloc] init];
    [point3 addObject:@(1)];
    [point3 addObject:@(1)];
    NSMutableArray *points = [[NSMutableArray alloc] initWithObjects:point, point2, point3, nil];
    Ability *attack = [[Ability alloc] initWithPoints:points Delay:1 Linger:1];
    [self.abilities addObject:attack];
    
    //1 - 2 in column in front
    point = [[NSMutableArray alloc] init];
    [point addObject:@(1)];
    [point addObject:@(0)];
    point2 = [[NSMutableArray alloc] init];
    [point2 addObject:@(2)];
    [point2 addObject:@(0)];
    points = [[NSMutableArray alloc] initWithObjects:point, point2, nil];
    attack = [[Ability alloc] initWithPoints:points Delay:0 Linger:1];
    [self.abilities addObject:attack];
    
    //2 - in front
    point = [[NSMutableArray alloc] init];
    [point addObject:@(1)];
    [point addObject:@(0)];
    points = [[NSMutableArray alloc] initWithObjects:point, nil];
    attack = [[Ability alloc] initWithPoints:points Delay:0 Linger:0];
    [self.abilities addObject:attack];
    
    //3 - in back
    point = [[NSMutableArray alloc] init];
    [point addObject:@(-1)];
    [point addObject:@(0)];
    points = [[NSMutableArray alloc] initWithObjects:point, nil];
    attack = [[Ability alloc] initWithPoints:points Delay:0 Linger:1];
    [self.abilities addObject:attack];
    
    point = [[NSMutableArray alloc] init];
    [point addObject:@(1)];
    [point addObject:@(1)];
    point2 = [[NSMutableArray alloc] init];
    [point2 addObject:@(1)];
    [point2 addObject:@(-1)];
    point3 = [[NSMutableArray alloc] init];
    [point3 addObject:@(-1)];
    [point3 addObject:@(1)];
    point4 = [[NSMutableArray alloc] init];
    [point4 addObject:@(-1)];
    [point4 addObject:@(-1)];
    points = [[NSMutableArray alloc] initWithObjects:point, point2, point3, point4, nil];
    attack = [[Ability alloc] initWithPoints:points Delay:1 Linger:1];
    [self.abilities addObject:attack];
    
    point = [[NSMutableArray alloc] init];
    [point addObject:@(1)];
    [point addObject:@(0)];
    point2 = [[NSMutableArray alloc] init];
    [point2 addObject:@(1)];
    [point2 addObject:@(1)];
    point3 = [[NSMutableArray alloc] init];
    [point3 addObject:@(1)];
    [point3 addObject:@(-1)];
    point4 = [[NSMutableArray alloc] init];
    [point4 addObject:@(0)];
    [point4 addObject:@(-1)];
    point5 = [[NSMutableArray alloc] init];
    [point5 addObject:@(0)];
    [point5 addObject:@(1)];
    point6 = [[NSMutableArray alloc] init];
    [point6 addObject:@(-1)];
    [point6 addObject:@(0)];
    point7 = [[NSMutableArray alloc] init];
    [point7 addObject:@(-1)];
    [point7 addObject:@(1)];
    point8 = [[NSMutableArray alloc] init];
    [point8 addObject:@(-1)];
    [point8 addObject:@(-1)];
    points = [[NSMutableArray alloc] initWithObjects:point, point2, point3, point4, point5, point6, point7, point8, nil];
    attack = [[Ability alloc] initWithPoints:points Delay:1 Linger:1];
    [self.abilities addObject:attack];
    
    return self;
}

-(void)causeDamage:(int)amount {
    [super causeDamage:amount];
    [gvc playerHPChanged];
}

@end
