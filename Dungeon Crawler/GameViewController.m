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

@synthesize hpGrid, gameGrid, engine;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameGrid = [[Grid alloc] initWithWidth:5 Height:5 xPos:30 yPos:160 tileSize:64];
    self.hpGrid = [[Grid alloc] initWithWidth:5 Height:1 xPos:30 yPos:70 tileSize:32];
    for (int i = 0; i < [self.hpGrid getWidth]; i++) {
        [[[self.hpGrid.tiles objectAtIndex:0] objectAtIndex:i] changeColor:[UIColor redColor]];
    }
    self.engine = [[GameEngine alloc] initWithGrid:self.gameGrid];
    self.engine.player.gvc = self;
    buttonTag = 0;
    [self.view addSubview:self.gameGrid];
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
        [self.engine.player attack];
    }
    [self.engine nextFrame];
}

-(void)playerTakeDamage:(int)amount {
    int hp = self.engine.player.health;
    for (int i = 4; i >= hp; i--) {
        [[[self.hpGrid.tiles objectAtIndex:0] objectAtIndex:i] changeColor:[UIColor whiteColor]];
    }
    if (hp == 0) {
        NSLog(@"Game Over!");
        self.engine.player.health = 5;
        for (int i = 0; i < [self.hpGrid getWidth]; i++) {
            [[[self.hpGrid.tiles objectAtIndex:0] objectAtIndex:i] changeColor:[UIColor redColor]];
        }
    }
}

@end
