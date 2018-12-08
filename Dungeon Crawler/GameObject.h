//
//  Header.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameObject : NSObject {
    int xPos;
    int yPos;
    bool blocks;
}

@property (strong, nonatomic) UIImageView *objectImageView;

-(id)initWithX:(int)x Y:(int)y Blocks:(bool)block Image:(NSString *)imageName;
-(int)getXPosition;
-(int)getYPosition;

@end
