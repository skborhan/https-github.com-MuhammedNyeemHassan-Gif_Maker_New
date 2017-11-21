//
//  NextViewController.m
//  GiFarre
//
//  Created by Sk Borhan Uddin on 20/11/17.
//  Copyright © 2017 Sk Borhan Uddin. All rights reserved.
//

#import "GifViewController.h"

@interface GifViewController ()

@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUx];
}

- (void) loadUx{
    _searchView.keyboardAppearance = UIKeyboardAppearanceDark;
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)_collectionView.collectionViewLayout;
    
    if( [collectionViewLayout respondsToSelector:@selector(setSectionHeadersPinToVisibleBounds:)]){
        collectionViewLayout.sectionHeadersPinToVisibleBounds = YES;
    }
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

#pragma mark - Collection Delegate

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1.0];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int fector = (10 * CELL_NUMBER_PER_ROW) + 10;
    return CGSizeMake((collectionView.frame.size.width - fector)/CELL_NUMBER_PER_ROW, (collectionView.frame.size.width - fector)/CELL_NUMBER_PER_ROW);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *review = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"MMMM, dd yyyy"];
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GifTopReusableView" forIndexPath:indexPath];
        
        review  = headerView;
    }
    return review;
    
}

- (void) LoadGifs{
    
}

- (void) LoadMemes{
    
}

#pragma mark - Button Events

- (IBAction)ChangeGifMeme:(UIButton *)sender {
    UIButton *gifBtn = [[sender superview] viewWithTag:GIF_LIST];
    UIButton *memeBtn = [[sender superview] viewWithTag:MEME_LIST];
    switch (sender.tag) {
        case GIF_LIST:
            [self LoadGifs];
            [gifBtn setBackgroundImage:[UIImage imageNamed:@"gifsinac"] forState:UIControlStateNormal];
            [memeBtn setBackgroundImage:[UIImage imageNamed:@"memein"] forState:UIControlStateNormal];
            break;
        case MEME_LIST:
            [self LoadMemes];
            [gifBtn setBackgroundImage:[UIImage imageNamed:@"gifsin"] forState:UIControlStateNormal];
            [memeBtn setBackgroundImage:[UIImage imageNamed:@"memeinac"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}

#pragma mark - SearchBar Delegates

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self hideSearchKeyboard:searchBar];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self hideSearchKeyboard:searchBar];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self hideSearchKeyboard:searchBar];
}

- (void)hideSearchKeyboard:(UISearchBar*)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

@end
