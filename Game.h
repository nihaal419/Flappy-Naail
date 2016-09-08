//
//  Game.h
//  Flappy Naail
//
//  Created by Nihaal Manesia on 3/15/14.
//  Copyright (c) 2014 N Squared Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController

{
    IBOutlet UIImageView *Bird;
    IBOutlet UIImageView *GetStarted;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UIImageView *ExitImage;
    IBOutlet UIButton *Home;
    IBOutlet UIImageView *HomeImage;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIImageView *GameOver;
    IBOutlet UIImageView *Score;
    IBOutlet UIImageView *Tap;
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
