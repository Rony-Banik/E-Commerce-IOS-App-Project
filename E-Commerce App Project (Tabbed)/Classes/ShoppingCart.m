//
//  ShoppingCart.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "ShoppingCart.h"

@interface ShoppingCart()

@property (strong, nonatomic) NSMutableArray* itemArray;
@end

@implementation ShoppingCart

- (id)init {
    self = [super init];
    if (self) {
        //Custom initialization
        self.itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}
+ (ShoppingCart *)sharedInstance
{
    static ShoppingCart*  _sharedCart;
    
    static dispatch_once_t once;
    dispatch_once(&once,^{
        _sharedCart = [[ShoppingCart alloc] init];
    });
    
    return _sharedCart;
}

- (NSArray *)itemsInCart{
    return self.itemArray;
}

- (BOOL)containsItem:(Item *)itemObject{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ID=%@",itemObject.ID];
    NSArray *duplicateItems = [self.itemArray filteredArrayUsingPredicate:predicate];
    return (duplicateItems.count > 0)? YES : NO;
}

- (void)addItem:(Item *)itemObject{
    if ([self containsItem:itemObject]) {
        itemObject.cartAddedQuantity= (itemObject.cartAddedQuantity+1);
        
    }else{
        itemObject.cartAddedQuantity= 1;
        [self.itemArray addObject:itemObject];
    }
    
}

- (void)removeItem:(Item *)itemObject{
    if (itemObject.cartAddedQuantity > 0) {
        itemObject.cartAddedQuantity= (itemObject.cartAddedQuantity-1);
    }else{
        itemObject.cartAddedQuantity = 0;
        [self.itemArray removeObject:itemObject];
    }
}
- (void)removeFromCart:(Item *)itemObject{
    itemObject.cartAddedQuantity= 0;
    [self.itemArray removeObject:itemObject];
}

- (void)clearCart{
    self.itemArray = [[NSMutableArray alloc]init];
}

- (NSNumber *)total{
    double total = 0;
    double totalSingleItemPrice;
    for (Item* itemObject in self.itemsInCart) {
        totalSingleItemPrice = (itemObject.cartAddedQuantity*itemObject.price);
        total += totalSingleItemPrice;
    }
    int roundedTotal = lroundf(total);
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:[@(roundedTotal) stringValue] forKey:@"cartTotalAmount"];
    [defaults synchronize];
    return @(total);
}
@end
