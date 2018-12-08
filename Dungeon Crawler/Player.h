//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

@protocol PlayerDelegate <NSObject>

-(void)playerHPChanged;

@end

@interface Player : Entity

@property id<PlayerDelegate> gvc;

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp;
-(void)causeDamage:(int)amount;

@end

