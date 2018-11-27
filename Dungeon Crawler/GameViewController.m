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

@synthesize hp1, hp2, hp3, hp4, hp5;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameGrid = [[Grid alloc] initWithWidth:5 Height:5];
    self.engine = [[GameEngine alloc] initWithGrid:self.gameGrid];
    buttonTag = 0;
    [self.view addSubview:self.gameGrid];
}

-(IBAction)buttonPressed:(UIButton*)sender {
    buttonTag = (int)sender.tag;
    if (buttonTag == 1) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:0 Y:1];
    }
    else if (buttonTag == 2) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:-1 Y:0];
    }
    else if (buttonTag == 3) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:1 Y:0];
    }
    else if (buttonTag == 4) {
        [self.engine updatePositionOfEntity:self.engine.player ByX:0 Y:-1];
    }
}

@end
