//
//  CreateViewController.h
//  GiFarre
//
//  Created by Sk Borhan Uddin on 21/11/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PHOTO_TO_GIF 201
#define VIDEO_TO_GIF 202
#define LPhoto_TO_GIF 203
#define LOOP_TO_GIF 204

@interface CreateViewController : UIViewController
- (IBAction)CreateGifFrom:(UIButton *)sender;

@end
