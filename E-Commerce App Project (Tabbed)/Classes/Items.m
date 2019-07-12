//
//  Items.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "Items.h"
#import "Item.h"

@implementation Items

+(Items *)sharedInstance{
    static Items* _sharedItems;
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        _sharedItems = [[Items alloc] init];
    });
    return _sharedItems;
}


- (id)init
{
    if((self = [super init]))
    {
        _allItems = [self loadItemsFromJSON];
    }
    return self;
}

- (NSArray *)loadItemsFromJSON {
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    
    NSError* error;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    NSMutableArray* itemArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* itemDictionary in jsonArray)
    {
        Item* itemObject = [[Item alloc] init];
        
        itemObject.ID = itemDictionary[@"id"];
        itemObject.sale = itemDictionary[@"Sale"];
        itemObject.itemName = itemDictionary[@"ProductName"];
        itemObject.photoURL = itemDictionary[@"URL"];
        itemObject.price = [itemDictionary[@"Price"] doubleValue];
        itemObject.itemCategory = itemDictionary[@"ProductType"];
        itemObject.brand = itemDictionary[@"BrandName"];
        itemObject.quality = itemDictionary[@"Quality"];
        itemObject.cartAddedQuantity = 0;
        [itemArray addObject:itemObject];
    }
    return itemArray;
}
@end
