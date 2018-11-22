//
//  Entity.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameObject.h"

@interface Entity : GameObject {
    int health;
}

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)blocks Health:(int)hp;
-(void)causeDamage:(int)amount;
-(void)movePositionByX:(int)x Y:(int)y;

@end
