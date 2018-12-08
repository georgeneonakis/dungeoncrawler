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
@property (strong, nonatomic) IBOutlet UIView *swipeView;
@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *aButton;
@property (strong, nonatomic) IBOutlet UIButton *bButton;

-(void) loadGame;
-(IBAction)buttonPressed:(UIButton*)sender;
-(void)playerHPChanged;
-(void)swipeLeftRight:(UISwipeGestureRecognizer *)swiper;
-(void)swipeUpDown:(UISwipeGestureRecognizer *)swiper;
-(void)tap:(UITapGestureRecognizer *)tapper;

@end

