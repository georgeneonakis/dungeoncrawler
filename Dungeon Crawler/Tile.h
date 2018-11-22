//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

@interface Tile : NSObject {
    int damageTime;
    int damageAmount;
    bool isDamaging;
}

@property (weak, nonatomic) GameObject *object;

-(id)init;
-(bool)isDamage;
-(void)setDamageWithAmount:(int)amount time:(int)time;
-(void)causeDamage;
-(void)tick;

@end
