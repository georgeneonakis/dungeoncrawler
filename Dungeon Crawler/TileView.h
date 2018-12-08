//
//  TileView.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-27.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIView {
    UIView *tileImage;
}

@property (strong, nonatomic) UIImageView *tileImageView;
@property (strong, nonatomic) UIImageView *decorationImageView;
@property (strong, nonatomic) UIView *effectView;
@property (strong, nonatomic) UIImageView *itemImageView;

-(void)changeEffectColor:(UIColor*)color;
-(void)stopEffect;

@end
