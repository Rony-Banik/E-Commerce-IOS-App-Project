//
//  CategoryItemList.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryItemList : NSObject

@property (strong, readonly, nonatomic) NSArray *tvCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *laptopCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *mobileCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *desktopCategoryItemsList;
@property (strong, readonly, nonatomic) NSArray *tabletCategoryItemsList;

+(CategoryItemList *)sharedInstance;
@end

NS_ASSUME_NONNULL_END
