//
//  SaleViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaleViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, readonly, nonatomic) NSArray *saleItemsList;
@property (strong, nonatomic) IBOutlet UICollectionView *saleCollectionView;

@end

NS_ASSUME_NONNULL_END
