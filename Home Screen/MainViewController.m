//
//  ViewController.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;
@property (strong, nonatomic) NSNumber *score;
@property NSInteger counter;

@property (weak, nonatomic) IBOutlet UIView *scoreContainerView;
@property (weak, nonatomic) IBOutlet UILabel *firstPointInfo;
@property (weak, nonatomic) IBOutlet UILabel *secondPointInfo;
@property (weak, nonatomic) IBOutlet UILabel *thirdPointInfo;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstPointInfo.alpha = 0.0;
    self.secondPointInfo.alpha = 0.0;
    self.thirdPointInfo.alpha = 0.0;

    self.score = [NSNumber numberWithInt:21];

    self.counter = 0;
    [self performSelector:@selector(animateCountUpScoreLabel)];
}

- (void)animateCountUpScoreLabel
{
    NSInteger upCountNum = arc4random_uniform(7);
    self.counter += upCountNum;
    self.scoreLabel.text = @(self.counter).description;
    if (self.counter < self.score.integerValue) {
        [self performSelector:@selector(animateCountUpScoreLabel) withObject:nil afterDelay:.1];
    }
}

- (IBAction)onScoreLabelTapped:(UITapGestureRecognizer *)tapGesture
{
    CGPoint point = [tapGesture locationInView:self.scoreContainerView];

    if (self.firstPointInfo.alpha == 1.0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.firstPointInfo.alpha = 0.0;
            self.secondPointInfo.alpha = 0.0;
            self.thirdPointInfo.alpha = 0.0;
        }];
    }
    else if (CGRectContainsPoint(self.scoreLabel.frame, point)) {
        [UIView animateWithDuration:0.2 animations:^{
            self.firstPointInfo.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                self.secondPointInfo.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.thirdPointInfo.alpha = 1.0;
                }];
            }];
        }];
    }
}

- (IBAction)onInfoButtonTapped:(id)sender
{
    NSLog(@"Info Button Tapped");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end