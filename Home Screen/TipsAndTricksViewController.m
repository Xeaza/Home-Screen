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
@property (weak, nonatomic) IBOutlet UILabel *swipeInstructionLabel;

@end

@implementation TipsAndTricksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ee" withExtension:@"gif"];

    self.tipsDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@[url, @"Type two 'e's to load all available emoji beging with your most recently used."], @"ee", nil];

    // Example code for animating gif
    self.gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:self.tipsDictionary[@"ee"][0]];

    self.instructionLabel.text = self.tipsDictionary[@"ee"][1];

    self.swipeInstructionLabel.alpha = 0.0;
    [UIView animateWithDuration:0.3 delay:3.0 options:UIViewAnimationOptionTransitionNone animations:^{
        self.swipeInstructionLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        // TODO: Save that user has seen this already in user defaults

        [UIView animateWithDuration:0.3 delay:2.0 options:UIViewAnimationOptionTransitionNone animations:^{
            self.swipeInstructionLabel.alpha = 0.0;
        } completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
