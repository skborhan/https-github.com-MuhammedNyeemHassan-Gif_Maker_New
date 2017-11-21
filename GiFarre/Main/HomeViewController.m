//
//  ViewController.m
//  GiFarre
//
//  Created by Sk Borhan Uddin on 11/20/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *navCreateViewController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"CreateViewControllerNav"];
    UINavigationController *navGifViewController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"GifViewControllerNav"];
    UINavigationController *navSavedViewController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SavedViewControllerNav"];
    UINavigationController *navSettingViewController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewControllerNav"];
    

    self.viewControllers = [NSArray arrayWithObjects:
                            [self viewControllerWithViewController:navCreateViewController title:@"Create" image:[UIImage imageNamed:@"create"] tag:CREATE],
                            [self viewControllerWithViewController:navGifViewController title:@"Gif" image:[UIImage imageNamed:@"gif"] tag:GIF],
                            [self viewControllerWithTabTitle:@"" image:nil],
                            [self viewControllerWithViewController:navSavedViewController title:@"Saved" image:[UIImage imageNamed:@"saved"] tag:SAVED],
                            [self viewControllerWithViewController:navSettingViewController title:@"Setting" image:[UIImage imageNamed:@"settings"] tag:SETTING], nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"camera"] highlightImage:[UIImage imageNamed:@"camera"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSLog(@"%lu --- %lu",self.selectedIndex,item.tag);
    if (self.selectedIndex == (item.tag - CREATE)) {
        return;
    }
    UIView * fromView = self.selectedViewController.view;
    UIView * toView = [[self.viewControllers objectAtIndex:(item.tag - CREATE)] view];
//
////     Transition using a page curl.
//    CATransition *transition = [[CATransition alloc] init];
//    transition.duration = 0.3;
//    transition.type = kCATransitionPush;
//    transition.subtype = (item.tag != 0 ? (item.tag - 101) : 0) < self.selectedIndex ? kCATransitionFromLeft : kCATransitionFromRight;
//    [toView.layer addAnimation:transition forKey:kCATransition];
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.5
                       options:((item.tag - CREATE) > self.selectedIndex ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight)
                    completion:^(BOOL finished) {
                        if (finished) {

                        }
                    }];
    
//    UINavigationController *navGifViewController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"GifViewControllerNav"];
//
//    switch (item.tag) {
//        case GIF:
//            [self tabBarController:self.tabBarController didSelectViewController:navGifViewController];
//            break;
//
//        default:
//            break;
//    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController: (UIViewController*)viewController {
    
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.25];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:
                                  kCAMediaTimingFunctionEaseIn]];
    [self.view.layer addAnimation:animation forKey:@"fadeTransition"];
}

@end
