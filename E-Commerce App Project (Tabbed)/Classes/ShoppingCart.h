//
//  ShoppingCart.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingCart : NSObject

+(ShoppingCart *)sharedInstance;

-(NSArray *) itemsInCart;

-(BOOL) containsItem:(Item *)itemObject;
-(void) addItem:(Item *)itemObject;
-(void) removeItem:(Item *)itemObject;
-(void) removeFromCart:(Item *)itemObject;

-(NSNumber *)total;

-(void) clearCart;

@end

NS_ASSUME_NONNULL_END
