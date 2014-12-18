//
//  ChatBubble.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/17/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ChatBubble.h"

@interface ChatBubble () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSString *message;
@property NSInteger durationToShowChatBubble;

@end

@implementation ChatBubble

#pragma mark -  init

- (instancetype)initWithMessage:(NSString *)message
{
    CGRect frame = [self getRectOfLabelForMessage:message];
    frame.origin.y += arc4random_uniform(150) + 20;
    frame.size.width += 40;
    frame.size.height += 40;

    if (frame.size.height < 50) {
        frame.size.height = 50;
    }

    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.message = message;
        [self createMessageLabel];
        self.alpha = 0.0;
        [self setUpTapGesture];
    }
    return self;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(11, 10, self.bounds.size.width - 20, self.bounds.size.height - 20) cornerRadius: 5];
    [white setFill];
    [rectanglePath fill];

    //// Bezier Drawing
    UIBezierPath* cornorArrowPath = UIBezierPath.bezierPath;
    [cornorArrowPath moveToPoint: CGPointMake(11.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84)];
    [cornorArrowPath addCurveToPoint: CGPointMake(4.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - .84) controlPoint1: CGPointMake(11.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84) controlPoint2: CGPointMake(8.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84)];
    [cornorArrowPath addCurveToPoint: CGPointMake(11.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84) controlPoint1: CGPointMake(0.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height + 2.16) controlPoint2: CGPointMake(11.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 3.84)];
    [cornorArrowPath addLineToPoint: CGPointMake(11.88, rectanglePath.bounds.origin.y + rectanglePath.bounds.size.height - 10.84)];
    [cornorArrowPath closePath];

    [white setFill];
    [cornorArrowPath fill];
    [white setStroke];
    cornorArrowPath.lineWidth = 1;
    [cornorArrowPath stroke];
}

#pragma mark - Public Methods

- (void)showChatBubble
{
    // Fade in Chat Bubble
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:[self readTimeForString:self.message] options:UIViewAnimationOptionCurveLinear animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

#pragma mark - Private Methods
#pragma mark - Label Control Methods
- (NSInteger)readTimeForString:(NSString *)message
{
    // Average words per second is 3 so give a little buffer to that
    NSArray *wordArray = [message componentsSeparatedByString:@" "];
    return wordArray.count / 3 + 5;
}

- (void)createMessageLabel
{
    CGRect labelFrame = [self getRectOfLabelForMessage:self.message];
    if (labelFrame.size.height < 50) {
        labelFrame.size.height = 50;
    }
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);

    UILabel *messageLabel = [[UILabel alloc] initWithFrame:labelFrame];
    messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    messageLabel.numberOfLines = 0;
    messageLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    messageLabel.text = self.message;
    messageLabel.center = centerPoint;
    
    [self addSubview:messageLabel];
}

- (CGRect)getRectOfLabelForMessage:(NSString *)message
{
    UIFont *messageFont = [UIFont fontWithName:@"Helvetica" size:17.0];
    CGSize constraintSize = CGSizeMake(280.0, MAXFLOAT);

    CGRect textRect = [message boundingRectWithSize:constraintSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:messageFont}
                                            context:nil];
    return textRect;
}


#pragma mark - Tap Gesture

- (void)setUpTapGesture
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideChatBubble:)];
    tapGestureRecognizer.delegate = self;

    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)hideChatBubble:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
