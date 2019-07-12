//
//  Item.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString* photoURL;
@property (strong, nonatomic) NSString* quality;
@property (strong, nonatomic) NSString* itemCategory;
@property (strong, nonatomic) NSString* brand;
@property double price;
@property (strong, nonatomic) NSNumber* sale;
@property (strong, nonatomic) NSNumber* ID;
@property double cartAddedQuantity;

@end

NS_ASSUME_NONNULL_END
