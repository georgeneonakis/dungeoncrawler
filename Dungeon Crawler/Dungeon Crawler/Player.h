//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

@interface Player : Entity

- (id)initWithHealth:(int)hp xPos:(int)x yPos:(int)y;

@end

