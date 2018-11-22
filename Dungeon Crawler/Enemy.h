//
//  Enemy.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-22.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

@interface Enemy : Entity

@property (strong, nonatomic) NSMutableArray *attackPattern;

-(void)attack;

@end
