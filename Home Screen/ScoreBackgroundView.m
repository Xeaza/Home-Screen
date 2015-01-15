//
//  ScoreBackgroundView.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 1/15/15.
//  Copyright (c) 2015 Taylor Wright-Sanson. All rights reserved.
//

#import "ScoreBackgroundView.h"

@implementation ScoreBackgroundView

- (void)drawRect:(CGRect)rect
{
    [self drawCircle];
    [self performSelector:@selector(drawALine) withObject:nil afterDelay:0.9];
    //[self performSelector:@selector(drawLeftPath) withObject:nil afterDelay:0.9];
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
    CGFloat startingPosition = 120;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(xPosition, self.layer.frame.size.width * .55 + 40)];
    // Top box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 50)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 50)];
    // Middle box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 100)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 100)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 150)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 150)];
    // Bottom box
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 200)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 200)];
    [path addLineToPoint:CGPointMake(xPosition + 100, xPosition + startingPosition + 250)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 250)];
    [path addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 300)];

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
    CGFloat startingPosition = 120;
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    [leftPath moveToPoint:CGPointMake(xPosition, xPosition + startingPosition)];
    // Top box
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 50)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 50)];
    // Middle box
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 100)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 100)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 150)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 150)];
    // Bottom box
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 200)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 200)];
    [leftPath addLineToPoint:CGPointMake(xPosition - 100, xPosition + startingPosition + 250)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 250)];
    [leftPath addLineToPoint:CGPointMake(xPosition, xPosition + startingPosition + 300)];

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

@end
