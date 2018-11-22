//
//  GameObject.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)block {
    self = [super init];
    xPos = x;
    yPos = y;
    blocks = block;
    return self;
}

-(int)getXPosition {
    return xPos;
}

-(int)getYPosition {
    return yPos;
}

@end
