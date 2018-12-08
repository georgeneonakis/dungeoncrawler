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
    [self.tileImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.tileImageView.layer setMagnificationFilter:kCAFilterNearest];
    [self.tileImageView.layer setMinificationFilter:kCAFilterNearest];
    self.tileImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    int val = rand() % 2;
    UIImage *tileImage = [UIImage imageNamed: [NSString stringWithFormat: @"Forest_Tile%d.png", val]];
    self.tileImageView.image = tileImage;
    [self addSubview: self.tileImageView];
    
    self.effectView = [[ UIView alloc] initWithFrame:self.bounds];
    self.effectView.alpha = 0.30;
    [self.effectView setHidden: YES];
    [self addSubview: self.effectView];
    return self;
}

-(void)changeEffectColor:(UIColor*)color {
    self.effectView.backgroundColor = color;
    [self.effectView setHidden: NO];
}

-(void)stopEffect {
    [self.effectView setHidden: YES];
}

@end
