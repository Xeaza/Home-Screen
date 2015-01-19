//
//  PaginatedViewController.m
//  Home Screen
//
//  Created by Taylor Wright-Sanson on 1/8/15.
//  Copyright (c) 2015 Taylor Wright-Sanson. All rights reserved.
//

#import "PaginatedViewController.h"
#import "MainViewController.h"
#import "TipsAndTricksViewController.h"

@interface PaginatedViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property NSInteger index;
@property NSInteger numberOfViewControllers;
@property (strong, nonatomic) NSArray *viewControllersIdentifiers;

@end

@implementation PaginatedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberOfViewControllers = 2;

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    //self.pageViewController.view.frame = self.view.bounds;
    // Change the size of page view controller
    self.viewControllersIdentifiers = @[@"ScoreViewController", @"TipsAndTricksViewController"];

    MainViewController *mainViewController = (MainViewController *)[self viewControllerAtIndex:0];

    [self.pageViewController setViewControllers:@[mainViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[TipsAndTricksViewController class]]) {
        return [self viewControllerAtIndex:0];
    }
    else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[MainViewController class]]) {
        return [self viewControllerAtIndex:1];
    }
    else {
        return nil;
    }
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    if (index == 0) {
        MainViewController * mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreViewController"];
        return mainViewController;
    }
    else {
        TipsAndTricksViewController *tipsAndTricksViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TipsAndTricksViewController"];
        return tipsAndTricksViewController;
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.numberOfViewControllers;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
