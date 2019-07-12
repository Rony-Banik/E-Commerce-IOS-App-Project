//
//  CategoryItemsViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 19/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryItemsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, readonly, nonatomic) NSArray *categoryItemsList;
@property (strong, nonatomic) IBOutlet UILabel *categoryName;

@property (strong, nonatomic) IBOutlet UICollectionView *categoryCollectionView;

@property (strong, nonatomic) NSArray *receivedCategoryItemsList;
@property NSString *receivedCategoryName;

@end

NS_ASSUME_NONNULL_END
