//
//  Ability.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-28.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ability : NSObject

@property (strong, nonatomic) NSMutableArray *shape;

-(id)initWithPoints:(NSMutableArray*)points;

@end
