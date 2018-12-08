//
//  GameObject.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)block Image:(NSString *)imageName {
    self = [super init];
    xPos = x;
    yPos = y;
    blocks = block;
    UIImage *objectImage = [UIImage imageNamed:imageName];
    NSLog(imageName);
    if( objectImage == nil)
    {
        NSLog(@"Fail");
    }
    [self.objectImageView.layer setMagnificationFilter:kCAFilterNearest];
    [self.objectImageView.layer setMinificationFilter:kCAFilterNearest];
    self.objectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    self.objectImageView.image = objectImage;
    return self;
}

-(int)getXPosition {
    return xPos;
}

-(int)getYPosition {
    return yPos;
}

@end
