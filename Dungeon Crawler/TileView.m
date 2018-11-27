//
//  TileView.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-27.
//  Copyright © 2018 George. All rights reserved.
//

#import "TileView.h"

@implementation TileView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor blackColor];
    tileImage = [[UIView alloc] initWithFrame:CGRectInset(self.bounds, 5, 5)];
    UIColor* white = [UIColor whiteColor];
    [self changeColor:white];
    [self addSubview:tileImage];
    return self;
}

-(void)changeColor:(UIColor*)color {
    tileImage.backgroundColor = color;
}

@end
