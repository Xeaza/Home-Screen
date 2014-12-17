//
//  ChatBubble.h
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/17/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatBubble : UIView

- (instancetype)initWithFrame:(CGRect)frame message:(NSString *)message;
- (void)showChatBubbleAfterDelay:(NSInteger)delay forDuration:(NSInteger)duration;

@end
