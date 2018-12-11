//
//  Levels.m
//  Dungeon Crawler
//
//  Created by George on 2018-12-11.
//  Copyright © 2018 George. All rights reserved.
//

#import "Levels.h"

@implementation Levels

@synthesize levelSpecs;

-(id)init {
    self.levelSpecs = [[NSMutableArray alloc] init];
    NSMutableArray *entity1 = [[NSMutableArray alloc] initWithObjects:@0, @1, @1, nil];
    NSMutableArray *entity2 = [[NSMutableArray alloc] initWithObjects:@0, @3, @1, nil];
    NSMutableArray *level1 = [[NSMutableArray alloc] initWithObjects:entity1, entity2, nil];
    [self.levelSpecs addObject:level1];
    return self;
}

@end
