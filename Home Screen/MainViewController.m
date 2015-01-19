//
//  ViewController.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "MainViewController.h"
//#import "ChatBubble.h"
#import "TipsAndTricksViewController.h"
#import "ScoreBackgroundView.h"

@interface MainViewController () <ScoreBackgroundViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;
@property (strong, nonatomic) NSNumber *score;
@property NSInteger counter;

@property (weak, nonatomic) IBOutlet UIView *scoreContainerView;

@property (strong, nonatomic) NSArray *tipsArray;
@property NSInteger pages;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.score = [NSNumber numberWithInt:211];

    self.counter = 0;
    [self performSelector:@selector(animateCountUpScoreLabel)];

    self.tipsArray = @[@"Did you know you can double tap on an emoji to replace the word your just typed?", @"Did you know that typing 'ee' loads all available emoji starting with your most recently used?"];

    //[NSTimer scheduledTimerWithTimeInterval:arc4random_uniform(60) + 30 target:self selector:@selector(showTip) userInfo:nil repeats:YES];

    ScoreBackgroundView *scoreBackgroundView = [[ScoreBackgroundView alloc] initWithFrame:self.view.frame];
    scoreBackgroundView.backgroundColor = [UIColor clearColor];
    scoreBackgroundView.delegate = self;
    [self.view addSubview:scoreBackgroundView];
}

#pragma mark - Score Label

- (void)animateCountUpScoreLabel
{
    //NSInteger upCountNum = arc4random_uniform(7);
    self.counter += 10;
    self.scoreLabel.text = @(self.counter).description;
    if (self.counter < self.score.integerValue) {
        [self performSelector:@selector(animateCountUpScoreLabel) withObject:nil afterDelay:0];
    }
}

#pragma mark - Tips & Tricks

//- (void)showTip
//{
//    NSString *randomTip = self.tipsArray[arc4random_uniform((int)self.tipsArray.count)];
//    ChatBubble *chatBubble = [[ChatBubble alloc] initWithMessage:randomTip];
//    [self.view addSubview:chatBubble];
//    [chatBubble showChatBubble];
//}

#pragma mark - Invite Friends

- (void)inviteFriendsButtonPressed
{
    NSLog(@"Invite Friends Button pressed");
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"url to share roxie"]
                                                                                         applicationActivities:nil];
    [self.navigationController presentViewController:activityViewController
                                            animated:YES
                                          completion:^{
                                              NSLog(@"Share Pressed");
                                          }];
}

#pragma mark - Info Button

- (IBAction)onInfoButtonTapped:(id)sender
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
