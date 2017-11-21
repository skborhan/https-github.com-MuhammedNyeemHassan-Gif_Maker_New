//
//  BaseViewController.h
//  GiFarre
//
//  Created by Sk Borhan Uddin on 20/11/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UITabBarController

-(UIViewController*) viewControllerWithTabTitle:(NSString*)title image:(UIImage*)image;
-(UIViewController*) viewControllerWithViewController:(UIViewController*)viewController title:(NSString*) title image:(UIImage*)image tag:(long)tag;
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage;

@end
