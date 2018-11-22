//
//  ViewController.h
//  Dungeon Crawler
//
//  Created by George on 2018-11-21.
//  Copyright © 2018 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "GameEngine.h"

@interface GameViewController : UIViewController {
    int buttonTag;
}

@property (weak, nonatomic) IBOutlet UIView *hp1;
@property (weak, nonatomic) IBOutlet UIView *hp2;
@property (weak, nonatomic) IBOutlet UIView *hp3;
@property (weak, nonatomic) IBOutlet UIView *hp4;
@property (weak, nonatomic) IBOutlet UIView *hp5;
@property (strong, nonatomic) GameEngine *engine;

-(IBAction)buttonPressed:(UIButton*)sender;

@end

