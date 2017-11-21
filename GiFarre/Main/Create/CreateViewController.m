//
//  CreateViewController.m
//  GiFarre
//
//  Created by Sk Borhan Uddin on 21/11/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CreateGifFrom:(UIButton *)sender {
    switch (sender.tag) {
        case PHOTO_TO_GIF:
            [self PhotoToGiF];
            break;
        case VIDEO_TO_GIF:
            
            break;
            
        case LPhoto_TO_GIF:
            
            break;
        
        case LOOP_TO_GIF:
            
            break;
            
        default:
            break;
    }
}

#pragma mark - Frature Calls

- (void)PhotoToGiF{
    
}

@end
