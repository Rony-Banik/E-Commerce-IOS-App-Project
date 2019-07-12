//
//  Items.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Items : NSObject
@property (strong, readonly, nonatomic) NSArray *allItems;

+ (Items *)sharedInstance;
@end

NS_ASSUME_NONNULL_END
