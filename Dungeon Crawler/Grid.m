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

-(id)initWithSize:(int)size xPos:(int)x yPos:(int)y tileSize:(int)s {
    self = [self initWithWidth:size Height:size xPos:x yPos:y tileSize:s];
    return self;
}

-(id)initWithWidth:(int)width Height:(int)height xPos:(int)x yPos:(int)y tileSize:(int)s {
    self = [super initWithFrame:CGRectMake(x, y, width*s, height*s)];
    self.tiles = [[NSMutableArray alloc] initWithCapacity:height];
    for (int i = 0; i < height; i++) {
        NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:width];
        for (int j = 0; j < width; j++) {
            TileView *tile = [[TileView alloc] initWithFrame:CGRectMake(j*s, i*s, s, s)];
            [row addObject:tile];
            [self addSubview:tile];
        }
        [self.tiles addObject:row];
    }
    return self;
}

-(id)initWithWidth:(int)width Height:(int)height xPos:(int)x yPos:(int)y tileSize:(int)s Image:(NSString *) imageName {
    self = [self initWithWidth:width Height:height xPos:x yPos:y tileSize:s];
    
    UIImage *tileImage = [UIImage imageNamed: imageName];
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            ((TileView*)self.tiles[i][j]).tileImageView.image = tileImage;
        }
    }
    return self;
}

-(void)addEffectLayerAtX:(int)x Y:(int)y Color:(UIColor *)color{
    [self.tiles[y][x] changeEffectColor:color];
}

-(void)stopEffectAtX:(int)x Y:(int)y {
    [self.tiles[y][x] stopEffect];
}

-(int)getWidth {
    return (int)[self.tiles[0] count];
}

-(int)getHeight {
    return (int)[self.tiles count];
}

@end
