//
//  ViewController.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameEngine.h"
#import "Grid.h"
#import "Player.h"

@interface GameViewController : UIViewController <PlayerDelegate>{
    int buttonTag;
}

@property (strong, nonatomic) Grid *hpGrid;
@property (strong, nonatomic) Grid *gameGrid;
@property (strong, nonatomic) GameEngine *engine;

-(IBAction)buttonPressed:(UIButton*)sender;
-(void)playerTakeDamage:(int)amount;

@end

