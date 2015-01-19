//
//  ScoreBackgroundView.h
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 1/15/15.
//  Copyright (c) 2015 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScoreBackgroundViewDelegate <NSObject>

- (void)inviteFriendsButtonPressed;

@end

@interface ScoreBackgroundView : UIView

@property id<ScoreBackgroundViewDelegate>delegate;

@end
