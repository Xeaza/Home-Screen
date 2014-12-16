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

@end

@implementation TipsAndTricksViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Example code for animating gif
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ee" withExtension:@"gif"];
    self.gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
