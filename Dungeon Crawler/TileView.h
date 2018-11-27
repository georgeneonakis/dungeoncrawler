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

-(void)changeColor:(UIColor*)color;

@end
