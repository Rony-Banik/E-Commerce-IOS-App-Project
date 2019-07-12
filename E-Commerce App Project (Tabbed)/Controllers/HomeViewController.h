//
//  HomeViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAPageControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,TAPageControlDelegate>

@property (strong, readonly, nonatomic) NSArray *tvCategory;
@property (strong, readonly, nonatomic) NSArray *laptopCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *mobileCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *desktopCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *tabletCategoryItemsList;

@property (strong, nonatomic) IBOutlet UICollectionView *tvCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *laptopCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *desktopCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *mobileCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *tabletCollectionView;

@property (strong, nonatomic) IBOutlet UIScrollView *sliderScrollView;
@property (strong,nonatomic) NSArray *sliderImagesData;
@property NSTimer *sliderTimer;
@property NSInteger sliderIndex;
@property (strong, nonatomic) TAPageControl *sliderCustomPageControl;
- (IBAction)televisionCategoryButton:(UIButton *)sender;
- (IBAction)laptopCategoryButton:(UIButton *)sender;
- (IBAction)desktopCategoryButton:(UIButton *)sender;
- (IBAction)mobileCategoryButton:(UIButton *)sender;
- (IBAction)tabletCategoryButton:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
