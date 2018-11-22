//
//  Player.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@implementation Player

- (id)initWithHealth:(int)hp xPos:(int)x yPos:(int)y {
    self = [super initWithX:x Y:y Blocks:false Health:hp];
    return self;
}

@end
