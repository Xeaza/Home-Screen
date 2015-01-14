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

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *emojiLabel;
@property (strong, nonatomic) NSNumber *score;
@property NSInteger counter;

@property (weak, nonatomic) IBOutlet UIView *scoreContainerView;
@property (weak, nonatomic) IBOutlet UILabel *firstPointInfo;
@property (weak, nonatomic) IBOutlet UILabel *secondPointInfo;
@property (weak, nonatomic) IBOutlet UILabel *thirdPointInfo;

@property (strong, nonatomic) NSArray *tipsArray;
@property NSInteger pages;

@property (strong, nonatomic) CABasicAnimation *rotateAnimation;
@property (weak, nonatomic) IBOutlet UILabel *typingWordsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sendingEmojiLabel;
@property (weak, nonatomic) IBOutlet UIButton *inviteFriendsButton;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstPointInfo.alpha = 0.0;
    self.secondPointInfo.alpha = 0.0;
    self.thirdPointInfo.alpha = 0.0;
    self.typingWordsLabel.alpha = 0.0;
    self.sendingEmojiLabel.alpha = 0.0;
    self.inviteFriendsButton.alpha = 0.0;

    self.score = [NSNumber numberWithInt:211];

    self.counter = 0;
    [self performSelector:@selector(animateCountUpScoreLabel)];

    self.tipsArray = @[@"Did you know you can double tap on an emoji to replace the word your just typed?", @"Did you know that typing 'ee' loads all available emoji starting with your most recently used?"];

    //[NSTimer scheduledTimerWithTimeInterval:arc4random_uniform(60) + 30 target:self selector:@selector(showTip) userInfo:nil repeats:YES];

    [self drawCircle];
    [self performSelector:@selector(drawALine) withObject:nil afterDelay:0.9];
    [self performSelector:@selector(animateEarnPointsLabelsAndButtonIntoPlaceOnEntry) withObject:nil afterDelay:1.8];
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

#pragma mark - Tips & Tricks

//- (void)showTip
//{
//    NSString *randomTip = self.tipsArray[arc4random_uniform((int)self.tipsArray.count)];
//    ChatBubble *chatBubble = [[ChatBubble alloc] initWithMessage:randomTip];
//    [self.view addSubview:chatBubble];
//    [chatBubble showChatBubble];
//}

#pragma mark - Animation 
- (void)drawCircle
{
    // ************************************************************
    // ***************** Drawing circle ***************************
    // ************************************************************
    CGRect circleRect = CGRectMake(self.view.center.x / 4.5, 20.0, self.view.frame.size.width * .55, self.view.frame.size.width * .55);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:CGRectGetWidth(circleRect) / 2.0];

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = circlePath.CGPath;
    circleLayer.frame = CGPathGetBoundingBox(circleLayer.path);
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.strokeColor = [UIColor whiteColor].CGColor;
    circleLayer.lineWidth = 3.0;

    self.rotateAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    self.rotateAnimation.duration = 1.0;
    self.rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    self.rotateAnimation.toValue = [NSNumber numberWithFloat:1.0];
    self.rotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.rotateAnimation.removedOnCompletion = YES;
    [self.view.layer addSublayer:circleLayer];
    [circleLayer addAnimation:self.rotateAnimation forKey:@"animateRotation"];
}

- (void)drawALine
{
    CGFloat xPosition = self.view.center.x;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(xPosition, self.view.frame.size.width * .55 + 40)];
    [path addLineToPoint:CGPointMake(xPosition, self.view.frame.size.height)];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 3.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;

    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration = 1.0;
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    drawAnimation.toValue = [NSNumber numberWithFloat:1.0];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    drawAnimation.removedOnCompletion = YES;

    [self.view.layer addSublayer:shapeLayer];
    [shapeLayer addAnimation:drawAnimation forKey:@"animateStroke"];
}

#pragma mark - CAAnimation Delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"Done");
}

#pragma mark - Earn Points Info

- (void)animateEarnPointsLabelsAndButtonIntoPlaceOnEntry
{
    // Get ending frames of labels and buttons
    CGRect typingWordsLabelEndingFrame = self.typingWordsLabel.frame;
    CGRect sendingEmojiLabelEndingFrame = self.sendingEmojiLabel.frame;
    CGRect inviteFriendsButtonEndingFrame = self.inviteFriendsButton.frame;

    // Set starting frame for typingWordsLabel
    CGRect typingWordsLabelStartingFrame = CGRectMake(self.typingWordsLabel.frame.origin.x, self.typingWordsLabel.frame.origin.y * 2, self.typingWordsLabel.frame.size.width, self.typingWordsLabel.frame.size.height);
    self.typingWordsLabel.frame = typingWordsLabelStartingFrame;

    // Set starting frame for sendingEmojiLabel
    CGRect sendingEmojiLabelStartingFrame = CGRectMake(self.sendingEmojiLabel.frame.origin.x, self.sendingEmojiLabel.frame.origin.y * 2, self.sendingEmojiLabel.frame.size.width, self.sendingEmojiLabel.frame.size.height);
    self.sendingEmojiLabel.frame = sendingEmojiLabelStartingFrame;

    // Set starting frame for invitingFriendsButton
    CGRect inviteFriendsButtonStartingFrame = CGRectMake(self.inviteFriendsButton.frame.origin.x, self.inviteFriendsButton.frame.origin.y * 2, self.inviteFriendsButton.frame.size.width, self.inviteFriendsButton.frame.size.height);
    self.inviteFriendsButton.frame = inviteFriendsButtonStartingFrame;

    // Reveal labels and buttons
    self.typingWordsLabel.alpha = 1.0;
    self.sendingEmojiLabel.alpha = 1.0;
    self.inviteFriendsButton.alpha = 1.0;

    [UIView animateWithDuration:0.5 animations:^{
        self.typingWordsLabel.frame = typingWordsLabelEndingFrame;

        [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.sendingEmojiLabel.frame = sendingEmojiLabelEndingFrame;
        } completion:nil];

        [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.inviteFriendsButton.frame = inviteFriendsButtonEndingFrame;
        } completion:nil];

    } completion:nil];
}

- (IBAction)onInviteFriendsButtonPressed:(id)sender
{

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
