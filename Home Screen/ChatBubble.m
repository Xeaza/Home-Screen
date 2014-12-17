//
//  ChatBubble.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/17/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ChatBubble.h"

@implementation ChatBubble

- (void)drawRect:(CGRect)rect
{
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    // Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(10.14, 3.81, 293, 200) cornerRadius: 5];
    [white setFill];
    [rectanglePath fill];

    // Corner Drawing
    UIBezierPath* cornorArrowPath = UIBezierPath.bezierPath;
    [cornorArrowPath
     moveToPoint: CGPointMake(rectanglePath.bounds.origin.x + 0.88, rectanglePath.bounds.size.height - 7)];

    [cornorArrowPath
     addCurveToPoint: CGPointMake(rectanglePath.bounds.origin.y + 0.07, rectanglePath.bounds.size.height + 3) controlPoint1: CGPointMake(rectanglePath.bounds.origin.x + 0.88, rectanglePath.bounds.size.height - 7) controlPoint2: CGPointMake(7.88, rectanglePath.bounds.size.height)];

    [cornorArrowPath
     addCurveToPoint: CGPointMake(rectanglePath.bounds.origin.x + 0.88, rectanglePath.bounds.size.height)
     controlPoint1: CGPointMake(-0.12, rectanglePath.bounds.size.height + 6)
     controlPoint2: CGPointMake(10.88, rectanglePath.bounds.size.height - 7 + 6)];

    [cornorArrowPath
     addLineToPoint: CGPointMake(rectanglePath.bounds.origin.x + 0.88, rectanglePath.bounds.size.height - 7)];

    [cornorArrowPath closePath];
    [white setFill];
    [cornorArrowPath fill];
    [white setStroke];
    cornorArrowPath.lineWidth = 1;
    [cornorArrowPath stroke];
}

@end
