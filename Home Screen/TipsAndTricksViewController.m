//
//  TipsAndTricksViewController.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 12/16/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "TipsAndTricksViewController.h"
#import "UIImage+animatedGIF.h"

@interface TipsAndTricksViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (strong, nonatomic) NSArray *tipsArray;
@property (strong, nonatomic) NSArray *urlArray;
@property (strong, nonatomic) NSMutableDictionary *tipsDictionary;
@property NSInteger currentTipCounter;

@end

@implementation TipsAndTricksViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ee" withExtension:@"gif"];
    NSURL *doubleTapUrl = [[NSBundle mainBundle] URLForResource:@"doubleTap" withExtension:@"gif"];

    self.currentTipCounter = 0;

    self.tipsDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@[url, @"Type two 'e's to load all available emoji beging with your most recently used."], @"ee", @[doubleTapUrl, @"Double tapping on an emoji replaces the last word you typed"], @"doubleTap", nil];

    // Example code for animating gif
    self.gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:self.tipsDictionary[@"ee"][0]];

    self.instructionLabel.text = self.tipsDictionary[@"ee"][1];
}

- (IBAction)onTapGesture:(UITapGestureRecognizer *)tapGesture
{
    [self showNextTip];
}

- (void)showNextTip
{
    self.currentTipCounter++;
    if (self.currentTipCounter > self.tipsDictionary.allKeys.count - 1) {
        self.currentTipCounter = 0;
    }

    [UIView animateWithDuration:0.3 animations:^{
        self.gifImageView.alpha = 0.0;
        self.instructionLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        NSString *randomTipKey = self.tipsDictionary.allKeys[self.currentTipCounter];
        self.gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:self.tipsDictionary[randomTipKey][0]];
        self.instructionLabel.text = self.tipsDictionary[randomTipKey][1];
        [UIView animateWithDuration:0.3 animations:^{
            self.gifImageView.alpha = 1.0;
            self.instructionLabel.alpha = 1.0;
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
