//
//  ChatBubble.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/17/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ChatBubble.h"

@interface ChatBubble ()

@property (nonatomic, strong) NSString *message;
@property NSInteger durationToShowChatBubble;

@end
@implementation ChatBubble

- (instancetype)initWithFrame:(CGRect)frame message:(NSString *)message
{
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.message = message;
        [self createMessageLabel];
        self.alpha = 0.0;
    }
    return self;
}

- (void)showChatBubbleAfterDelay:(NSInteger)delay forDuration:(NSInteger)duration
{
    // Fade in Chat Bubble
    [UIView animateWithDuration:0.3 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:duration options:UIViewAnimationOptionCurveLinear animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}
- (void)drawRect:(CGRect)rect
{
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(7, 10, self.frame.size.width - 20, self.frame.size.height - 20) cornerRadius: 5];
    [white setFill];
    [rectanglePath fill];

    //// Bezier Drawing
    UIBezierPath* cornorArrowPath = UIBezierPath.bezierPath;
    [cornorArrowPath moveToPoint: CGPointMake(7.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84)];
    [cornorArrowPath addCurveToPoint: CGPointMake(0.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - .84) controlPoint1: CGPointMake(7.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84) controlPoint2: CGPointMake(4.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84)];
    [cornorArrowPath addCurveToPoint: CGPointMake(7.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84) controlPoint1: CGPointMake(-3.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height + 2.16) controlPoint2: CGPointMake(7.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84)];
    [cornorArrowPath addLineToPoint: CGPointMake(7.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84)];
    [cornorArrowPath closePath];

    [white setFill];
    [cornorArrowPath fill];
    [white setStroke];
    cornorArrowPath.lineWidth = 1;
    [cornorArrowPath stroke];
}

@end
