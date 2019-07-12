//
//  CategoryItemList.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "CategoryItemList.h"
#import "Item.h"
#import "Items.h"

@implementation CategoryItemList

+(CategoryItemList *)sharedInstance{
    static CategoryItemList* _sharedCategoryList;
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        _sharedCategoryList = [[CategoryItemList alloc] init];
    });
    return _sharedCategoryList;
}

- (id)init
{
    if((self = [super init]))
    {
        NSArray *allItemsList = [Items sharedInstance].allItems;
        
        _tvCategoryItemsList = [self returnCategoryArray:allItemsList forCategory:@"Television"];
        _laptopCategoryItemsList= [self returnCategoryArray:allItemsList forCategory:@"Laptops"];
        _desktopCategoryItemsList= [self returnCategoryArray:allItemsList forCategory:@"Desktop"];
        _mobileCategoryItemsList= [self returnCategoryArray:allItemsList forCategory:@"Mobile"];
        _tabletCategoryItemsList= [self returnCategoryArray:allItemsList forCategory:@"Tablet"];
    }
    return self;
}


-(NSArray *)returnCategoryArray:(NSArray *)allItems
                    forCategory:(NSString *)itemCategoryName{
    
    NSMutableArray *theCategory;
    theCategory = [allItems mutableCopy];
    
    Item* runningItem;
    
    for (int i=0; i<allItems.count; i++) {
        if (![[allItems[i] itemCategory]  isEqual: itemCategoryName]) {
            runningItem=allItems[i];
            [theCategory removeObject:allItems[i]];
        }
    }
    return theCategory;
}
@end
