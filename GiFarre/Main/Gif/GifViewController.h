//
//  NextViewController.h
//  GiFarre
//
//  Created by Sk Borhan Uddin on 20/11/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GifTopReusableView.h"

#define GIF_LIST 301
#define MEME_LIST 302

@protocol ButtonDelegate <NSObject>
-(void)gotoViewController:(UIButton *)sender;
@end


@interface GifViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) id<ButtonDelegate> delegate;
- (IBAction)ChangeGifMeme:(UIButton *)sender;

@end
