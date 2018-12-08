//
//  ViewController.m
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

@synthesize swipeView, hpGrid, gameGrid, engine, upButton, downButton, leftButton, rightButton, aButton, bButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *up = [UIImage imageNamed: @"UpArrow_Sprite0.png"];
    UIImage *down = [UIImage imageNamed: @"DownArrow_Sprite0.png"];
    UIImage *left = [UIImage imageNamed: @"LeftArrow_Sprite0.png"];
    UIImage *right = [UIImage imageNamed: @"RightArrow_Sprite0.png"];
    UIImage *A = [UIImage imageNamed: @"AButton_Sprite0.png"];
    UIImage *B = [UIImage imageNamed: @"BButton_Sprite0.png"];
    
    UIImageView *newView = [[UIImageView alloc] initWithFrame:self.upButton.bounds];
    newView.image = up;
    [self.upButton addSubview:newView];
    newView = [[UIImageView alloc] initWithFrame:self.downButton.bounds];
    newView.image = down;
    [self.downButton addSubview:newView];
    newView = [[UIImageView alloc] initWithFrame:self.leftButton.bounds];
    newView.image = left;
    [self.leftButton addSubview:newView];
    newView = [[UIImageView alloc] initWithFrame:self.rightButton.bounds];
    newView.image = right;
    [self.rightButton addSubview:newView];
    newView = [[UIImageView alloc] initWithFrame:self.aButton.bounds];
    newView.image = A;
    [self.aButton addSubview:newView];
    newView = [[UIImageView alloc] initWithFrame:self.bButton.bounds];
    newView.image = B;
    [self.bButton addSubview:newView];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftRight:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.swipeView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.swipeView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpDown:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.swipeView addGestureRecognizer:swipeUp];
    
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpDown:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.swipeView addGestureRecognizer:swipeDown];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.swipeView addGestureRecognizer:tap];
    
    [self loadGame];
}

-(void)loadGame {
    self.gameGrid = [[Grid alloc] initWithWidth:5 Height:5 xPos:10 yPos: 10 tileSize:64];
    self.hpGrid = [[Grid alloc] initWithWidth:5 Height:1 xPos:30 yPos:70
                                     tileSize:32 Image: @"HealthPoint_Sprite0.png"];
    for (int i = 0; i < [self.hpGrid getWidth]; i++) {
        // Put something here for hp
    }
    self.engine = [[GameEngine alloc] initWithGrid:self.gameGrid];
    self.engine.player.gvc = self;
    buttonTag = 0;
    [self.swipeView addSubview:self.gameGrid];
    [self.view addSubview:self.hpGrid];
}

-(IBAction)buttonPressed:(UIButton*)sender {
    buttonTag = (int)sender.tag;
    if (buttonTag == 1) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:0 Y:-1];
        self.engine.player.direction = 0;
    }
    else if (buttonTag == 2) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:-1 Y:0];
        self.engine.player.direction = 3;
    }
    else if (buttonTag == 3) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:1 Y:0];
        self.engine.player.direction = 1;
    }
    else if (buttonTag == 4) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:0 Y:1];
        self.engine.player.direction = 2;
    }
    else if (buttonTag == 7) {
        [self.engine.player performAbility:0];
    }
    else if (buttonTag == 8) {
        [self.engine.player performAbility:1];
    }
    [self.engine nextFrame];
    if( buttonTag == 5) {
        [self loadGame];
    }
}

-(void)playerTakeDamage:(int)amount {
    int hp = self.engine.player.health;
    UIImage *noHealth = [UIImage imageNamed: @"HealthPoint_Sprite1.png"];
    for (int i = 4; i >= hp; i--) {
        ((TileView *)self.hpGrid.tiles[0][i]).tileImageView.image = noHealth;
    }
    if (hp == 0) {
        UIImage *someHealth = [UIImage imageNamed: @"HealthPoint_Sprite0.png"];
        NSLog(@"Game Over!");
        [self loadGame];
    }
}

-(void)swipeLeftRight:(UISwipeGestureRecognizer *)swiper {
    [self.engine.player performAbility:3];
    [self.engine nextFrame];
}

-(void)swipeUpDown:(UISwipeGestureRecognizer *)swiper {
    [self.engine.player performAbility:4];
    [self.engine nextFrame];
}

-(void)tap:(UITapGestureRecognizer *)tapper {
    [self.engine.player performAbility:5];
    [self.engine nextFrame];
}


@end
