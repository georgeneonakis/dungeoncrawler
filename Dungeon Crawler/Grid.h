//
//  Grid.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-27.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TileView.h"

@interface Grid : UIView

@property (strong, nonatomic) NSMutableArray *tiles;

-(id)initWithWidth:(int)width Height:(int)height xPos:(int)x yPos:(int)y tileSize:(int)s;
-(id)initWithSize:(int)size xPos:(int)x yPos:(int)y tileSize:(int)s;
-(int)getWidth;
-(int)getHeight;
-(void)addEffectLayerAtX:(int)x Y:(int)y Color:(UIColor *)color;
-(void)stopEffectAtX:(int)x Y:(int)y;
-(id)initWithWidth:(int)width Height:(int)height xPos:(int)x yPos:(int)y tileSize:(int)s Image:(NSString *) imageName;

@end
