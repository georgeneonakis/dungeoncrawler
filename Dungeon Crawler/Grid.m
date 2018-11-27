//
//  Grid.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-27.
//  Copyright © 2018 George. All rights reserved.
//

#import "Grid.h"

@implementation Grid

@synthesize tiles;

-(id)initWithSize:(int)size {
    self = [self initWithWidth:size Height:size];
    return self;
}

-(id)initWithWidth:(int)width Height:(int)height {
    self = [super initWithFrame:CGRectMake(30, 160, width*64, height*64)];
    self.tiles = [[NSMutableArray alloc] initWithCapacity:width];
    for (int i = 0; i < width; i++) {
        NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:height];
        for (int j = 0; j < height; j++) {
            TileView *tile = [[TileView alloc] initWithFrame:CGRectMake(i*64, j*64, 64, 64)];
            [row addObject:tile];
            [self addSubview:tile];
        }
        [self.tiles addObject:row];
    }
    return self;
}

-(void)changeColorOfTileAtX:(int)x Y:(int)y Color:(UIColor *)color {
    NSLog(@"x:%d, y:%d", x, y);
    [[[self.tiles objectAtIndex:x] objectAtIndex:y] changeColor:color];
}

@end
