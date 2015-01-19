//
//  ScoreBackgroundView.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 1/15/15.
//  Copyright (c) 2015 Taylor Wright-Sanson. All rights reserved.
//

#import "ScoreBackgroundView.h"

@implementation ScoreBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addMoreYouTypeLabelWithDelay:1.2];
        [self addUseEmojiLabelWithDelay:1.5];
        [self addInviteFriendsButtonWithDelay:1.8];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self drawCircle];
    [self performSelector:@selector(drawALine) withObject:nil afterDelay:0.9];
    [self performSelector:@selector(drawLeftPath) withObject:nil afterDelay:0.9];
}

- (void)drawCircle
{
    // ************************************************************
    // ***************** Drawing circle ***************************
    // ************************************************************
    CGRect circleRect = CGRectMake(self.center.x / 4.5, 20.0, self.layer.frame.size.width * .55, self.layer.frame.size.width * .55);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:CGRectGetWidth(circleRect) / 2.0];

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = circlePath.CGPath;
    circleLayer.frame = CGPathGetBoundingBox(circleLayer.path);
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.strokeColor = [UIColor whiteColor].CGColor;
    circleLayer.lineWidth = 3.0;

    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    rotateAnimation.duration = 1.0;
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:1.0];
    rotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotateAnimation.removedOnCompletion = YES;
    [self.layer addSublayer:circleLayer];
    [circleLayer addAnimation:rotateAnimation forKey:@"animateRotation"];
}

- (void)drawALine
{
    CGFloat xPosition = self.center.x;
    CGFloat startingPosition = self.layer.frame.size.height * .13;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(xPosition, self.layer.frame.size.width * .55 + 40)];
    // Top box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 50)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 50)];
    // Middle box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 50)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition * 1.35 + 50)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition * 1.35 + 100)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 100)];
    // Bottom box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 130)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition * 1.35 + 130)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition * 1.35 + 180)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 180)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 3.0 + 250)];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;

    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration = 1.5;
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    drawAnimation.toValue = [NSNumber numberWithFloat:1.0];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    drawAnimation.removedOnCompletion = YES;

    [self.layer addSublayer:shapeLayer];
    [shapeLayer addAnimation:drawAnimation forKey:@"animateStroke"];
}

- (void)drawLeftPath
{
    CGFloat xPosition = self.center.x;
    CGFloat startingPosition = self.layer.frame.size.height * .13;
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    [leftPath moveToPoint:CGPointMake(xPosition, xPosition + startingPosition)];
    // Top box
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 50)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 50)];
    // Middle box
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 50)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition * 1.35 + 50)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition * 1.35 + 100)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 100)];
    // Bottom box
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 130)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition * 1.35 + 130)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition * 1.35 + 180)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 1.35 + 180)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition * 3.0 + 250)];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = leftPath.CGPath;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 2.0; 
    shapeLayer.fillColor = [UIColor clearColor].CGColor;

    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration = 1.5;
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    drawAnimation.toValue = [NSNumber numberWithFloat:1.0];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    drawAnimation.removedOnCompletion = YES;

    [self.layer addSublayer:shapeLayer];
    [shapeLayer addAnimation:drawAnimation forKey:@"animateStroke"];
}


- (void)addMoreYouTypeLabelWithDelay:(float)delay
{
    UILabel *typeMoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - 95, self.center.x + self.layer.frame.size.height * .13, 190, 50)];
    [self defaultLabelSettings:typeMoreLabel];
    typeMoreLabel.text = @"The more you type with Roxie the more points you earn";
    [self addSubview:typeMoreLabel];
    typeMoreLabel.alpha = 0.0;

    [UIView animateWithDuration:0.3 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        typeMoreLabel.alpha = 1.0;
    } completion:nil];
}

- (void)addUseEmojiLabelWithDelay:(float)delay
{
    CGFloat startingPosition = self.center.x + self.layer.frame.size.height * .13 * 1.35;
    UILabel *moreEmojiLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - 95, startingPosition + 50, 190, 50)];
    [self defaultLabelSettings:moreEmojiLabel];
    moreEmojiLabel.text = @"Express yourself with more emoji to earn points";
    [self addSubview:moreEmojiLabel];
    moreEmojiLabel.alpha = 0.0;

    [UIView animateWithDuration:0.3 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        moreEmojiLabel.alpha = 1.0;
    } completion:nil];
}

- (void)addInviteFriendsButtonWithDelay:(float)delay
{
    CGFloat startingPosition = self.center.x + self.layer.frame.size.height * .13 * 1.35;
    UIButton *inviteFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [inviteFriendsButton addTarget:self action:@selector(inViteFriendsbuttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:inviteFriendsButton];

    [inviteFriendsButton setTitle:@"Invite Friends" forState:UIControlStateNormal];
    inviteFriendsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17.0];
    [inviteFriendsButton setContentEdgeInsets:UIEdgeInsetsMake(0, 4, 0, 4)];
    [inviteFriendsButton sizeToFit];
    inviteFriendsButton.frame = CGRectMake(self.center.x - 100, startingPosition + 130, 200, 50);

    [inviteFriendsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [inviteFriendsButton setBackgroundImage:[self imageWithColor:[UIColor colorWithWhite:1.0 alpha:0.2]] forState:UIControlStateNormal];
    [inviteFriendsButton setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateHighlighted];


    inviteFriendsButton.alpha = 0.0;

    [UIView animateWithDuration:0.3 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        inviteFriendsButton.alpha = 1.0;
    } completion:nil];
}

- (void)defaultLabelSettings:(UILabel *)label
{
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.5;
    label.numberOfLines = 0;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17.0];
    label.textColor = [UIColor whiteColor];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (void)inViteFriendsbuttonPressed:(id)sender
{
    NSLog(@"Invite Friends Button pressed");
}


@end
