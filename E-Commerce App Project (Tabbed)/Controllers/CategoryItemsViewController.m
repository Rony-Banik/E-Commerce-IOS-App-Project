//
//  CategoryItemsViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 19/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "CategoryItemsViewController.h"
#import "Item.h"
#import "Items.h"
#import "SingleItemViewController.h"

@interface CategoryItemsViewController ()

@end

@implementation CategoryItemsViewController
@synthesize categoryCollectionView,categoryItemsList,categoryName,receivedCategoryItemsList,receivedCategoryName;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    categoryCollectionView.dataSource=self;
    categoryCollectionView.delegate=self;
    categoryItemsList=receivedCategoryItemsList;
    categoryName.text=receivedCategoryName;
    self.navigationItem.title=receivedCategoryName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSObject *individualData=categoryItemsList[indexPath.row];
    UICollectionViewCell *collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"categoryCellIdentifier" forIndexPath:indexPath];
    
    UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:1001];
    UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:1002];
    UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:1003];
    
    NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    itemImage.image=[UIImage imageWithData:data];
    itemName.text=[individualData valueForKey:@"itemName"];
    itemPrice.text= [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
    
    return collectioViewCell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return categoryItemsList.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SingleItemViewController *singleItemView =[self.storyboard instantiateViewControllerWithIdentifier:@"singleItemViewStoryBoardIdentifier"];
    
    NSObject *individualData= [categoryItemsList objectAtIndex:indexPath.row];
    
    singleItemView.itemObjectReceived = [categoryItemsList objectAtIndex:indexPath.row];
    
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
