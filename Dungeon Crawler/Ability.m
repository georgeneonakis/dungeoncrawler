//
//  Ability.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-28.
//  Copyright © 2018 George. All rights reserved.
//

#import "Ability.h"

@implementation Ability

-(id)initWithPoints:(NSMutableArray *)points {
    self = [super init];
    self.shape = [[NSMutableArray alloc] init];
    for (int i = 0; i < [points count]; i++) {
        [self.shape addObject:points[i]];
    }
    return self;
}

@end
