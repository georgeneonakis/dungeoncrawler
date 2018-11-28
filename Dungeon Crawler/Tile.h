//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

@interface Tile : NSObject

@property (weak, nonatomic) GameObject *object;
@property int damageTime;
@property int damageAmount;
@property int damageDelay;
@property bool isDamaging;
@property bool isDelayed;

-(id)init;
-(bool)isDamage;
-(void)setDamageWithAmount:(int)amount time:(int)time after:(int)delay;
-(void)causeDamage;
-(void)tick;

@end
