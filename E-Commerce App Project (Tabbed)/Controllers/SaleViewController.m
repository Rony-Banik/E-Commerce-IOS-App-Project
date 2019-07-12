//
//  SaleViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "SaleViewController.h"
#import "Item.h"
#import "Items.h"
#import "SingleItemViewController.h"
#import "ShoppingCart.h"

@interface SaleViewController ()

@end

@implementation SaleViewController

@synthesize saleCollectionView;
@synthesize saleItemsList;

- (id)init
{
    if((self = [super init]))
    {
        NSArray *allItemsList = [Items sharedInstance].allItems;
        saleItemsList = [self returnSaleArray:allItemsList];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    saleCollectionView.dataSource=self;
    saleCollectionView.delegate=self;
    
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSArray *)returnSaleArray:(NSArray *)allItems{
    
    NSMutableArray *saleItems;
    saleItems = [allItems mutableCopy];
    
    Item* runningItem;
    
    for (int i=0; i<allItems.count; i++) {
         if ([[allItems[i] sale] isEqualToNumber:@0]) {
            runningItem=allItems[i];
            [saleItems removeObject:allItems[i]];
        }
    }
    return saleItems;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSArray *allItemsList = [Items sharedInstance].allItems;
    saleItemsList = [self returnSaleArray:allItemsList];
    NSObject *individualData=saleItemsList[indexPath.row];
    UICollectionViewCell *collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sellCellIdentifier" forIndexPath:indexPath];

    UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:601];
    UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:602];
    UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:603];

    NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    itemImage.image=[UIImage imageWithData:data];
    itemName.text=[individualData valueForKey:@"itemName"];
    itemPrice.text= [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];

    return collectioViewCell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *allItemsList = [Items sharedInstance].allItems;
    saleItemsList = [self returnSaleArray:allItemsList];
    return saleItemsList.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    SingleItemViewController *singleItemView =[self.storyboard instantiateViewControllerWithIdentifier:@"singleItemViewStoryBoardIdentifier"];

        NSObject *individualData= [saleItemsList objectAtIndex:indexPath.row];

        singleItemView.itemObjectReceived = [saleItemsList objectAtIndex:indexPath.row];

        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];



    [self.navigationController pushViewController:singleItemView animated:YES];
}
-(NSString *)showPrice:(double)price{
    NSString *tempPriceString = [[NSNumber numberWithDouble:price] stringValue];
    NSString *priceString = [NSString stringWithFormat:@"$%@",tempPriceString];
    return priceString;
}
@end
