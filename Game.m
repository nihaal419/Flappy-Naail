//
//  Game.m
//  Flappy Naail
//
//  Created by Nihaal Manesia on 3/15/14.
//  Copyright (c) 2014 N Squared Productions. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(IBAction)StartGame:(id)sender
{
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    
    StartGame.hidden = YES;
    Tap.hidden = YES;
    Exit.hidden = YES;
    ExitImage.hidden = YES;
    Home.hidden = YES;
    HomeImage.hidden = YES;
    GetStarted.hidden = YES;
    GameOver.hidden = YES;
    Score.hidden = YES;
    ScoreLabel.hidden = NO;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

-(void)GameOver
{
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    Exit.hidden = NO;
    GameOver.hidden = NO;
    Score.hidden = NO;
    ExitImage.hidden = NO;
    Home.hidden = NO;
    HomeImage.hidden = NO;
    Tap.hidden = YES;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
    if (ScoreNumber > HighScoreNumber)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
}

-(void)Score
{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i",ScoreNumber];
}

-(void)TunnelMoving
{
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if (TunnelTop.center.x < -28)
    {
        [self PlaceTunnels];
    }
    
    if (TunnelTop.center.x == 3)
    {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame))
    {
        [self GameOver];
    }
}

-(void)PlaceTunnels
{
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition -300;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 650;
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
}

-(void)BirdMoving
{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15)
    {
        BirdFlight = -15;
    }
    
    if (BirdFlight > 0)
    {
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }
    
    if (BirdFlight < 0)
    {
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    BirdFlight = 18;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Tap.hidden = NO;
    
    Exit.hidden = YES;
    ExitImage.hidden = YES;
    Home.hidden = YES;
    HomeImage.hidden = YES;
    ScoreLabel.hidden = YES;
    GameOver.hidden = YES;
    Score.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
