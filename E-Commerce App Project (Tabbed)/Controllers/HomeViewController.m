//
//  HomeViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "HomeViewController.h"
#import "Item.h"
#import "Items.h"
#import "CategoryItemList.h"
#import "SingleItemViewController.h"
#import "ShoppingCart.h"
#import "CategoryItemsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize tvCollectionView;
@synthesize tvCategory;

@synthesize laptopCollectionView;
@synthesize laptopCategoryItemsList;

@synthesize desktopCollectionView;
@synthesize desktopCategoryItemsList;

@synthesize mobileCollectionView;
@synthesize mobileCategoryItemsList;

@synthesize tabletCollectionView;
@synthesize tabletCategoryItemsList;

@synthesize sliderScrollView,sliderImagesData,sliderTimer,sliderIndex,sliderCustomPageControl;
- (void)viewDidLoad {
    [super viewDidLoad];
    sliderScrollView.delegate=self;
    sliderImagesData= @[@"image1.jpg", @"image2.png", @"image4.jpg", @"image5.jpg"];
    for(int i=0; i<sliderImagesData.count;i++){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) * i, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(sliderScrollView.frame))];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:[sliderImagesData objectAtIndex:i]];
        [sliderScrollView addSubview:imageView];
    }
    sliderIndex = 0;
    
    // Progammatically init a TAPageControl with a custom dot view.
    sliderCustomPageControl = [[TAPageControl alloc] initWithFrame:CGRectMake(20,sliderScrollView.frame.origin.y+sliderScrollView.frame.size.height,sliderScrollView.frame.size.width,40)];//CGRectMake(0, CGRectGetMaxY(self.scrollView.frame) - 100, CGRectGetWidth(self.scrollView.frame), 40)
    // Example for touch bullet event
    sliderCustomPageControl.delegate      = self;
    sliderCustomPageControl.numberOfPages = sliderImagesData.count;
    sliderCustomPageControl.dotSize       = CGSizeMake(20, 20);
    sliderScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * sliderImagesData.count, CGRectGetHeight(sliderScrollView.frame));
    [sliderScrollView addSubview:sliderCustomPageControl];
    //end slider viewdidLoad
    
    tvCollectionView.dataSource=self;
    tvCollectionView.delegate=self;
    
    laptopCollectionView.dataSource=self;
    laptopCollectionView.delegate=self;
    
    desktopCollectionView.dataSource=self;
    desktopCollectionView.delegate=self;
    
    mobileCollectionView.dataSource=self;
    mobileCollectionView.delegate=self;
    
    tabletCollectionView.dataSource=self;
    tabletCollectionView.delegate=self;
    
    tvCategory = [CategoryItemList sharedInstance].tvCategoryItemsList;
    laptopCategoryItemsList = [CategoryItemList sharedInstance].laptopCategoryItemsList;
    desktopCategoryItemsList= [CategoryItemList sharedInstance].desktopCategoryItemsList;
    mobileCategoryItemsList= [CategoryItemList sharedInstance].mobileCategoryItemsList;
    tabletCategoryItemsList= [CategoryItemList sharedInstance].tabletCategoryItemsList;
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSObject *individualData;
    UICollectionViewCell *collectioViewCell;
    if (collectionView==self.tvCollectionView) {
        individualData=tvCategory[indexPath.row];
         collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tvCellIdentifier" forIndexPath:indexPath];
        
        UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:101];
        UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:102];
        UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:103];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        itemImage.image=[UIImage imageWithData:data];
        itemName.text=[individualData valueForKey:@"itemName"];
        itemPrice.text = [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
        
        return collectioViewCell;
        
    }else if (collectionView==self.laptopCollectionView){
        individualData=laptopCategoryItemsList[indexPath.row];
         collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"laptopCellIdentifier" forIndexPath:indexPath];
        
        UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:201];
        UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:202];
        UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:203];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        itemImage.image=[UIImage imageWithData:data];
        itemName.text=[individualData valueForKey:@"itemName"];
        itemPrice.text = [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
        
        return collectioViewCell;
    }else if(collectionView==self.desktopCollectionView){
        individualData=desktopCategoryItemsList[indexPath.row];
         collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"desktopCellIdentifier" forIndexPath:indexPath];
        
        UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:301];
        UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:302];
        UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:303];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        itemImage.image=[UIImage imageWithData:data];
        itemName.text=[individualData valueForKey:@"itemName"];
        itemPrice.text = [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
        
        return collectioViewCell;
    }else if(collectionView==self.mobileCollectionView){
        individualData=mobileCategoryItemsList[indexPath.row];
        
         collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mobileCellIdentifiernow" forIndexPath:indexPath];
        
        UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:401];
        UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:402];
        UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:403];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        itemImage.image=[UIImage imageWithData:data];
        itemName.text=[individualData valueForKey:@"itemName"];
        itemPrice.text = [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
        
        return collectioViewCell;
    }else{
        individualData=tabletCategoryItemsList[indexPath.row];
         collectioViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tabletCellIdentifier" forIndexPath:indexPath];
        
        UIImageView *itemImage = (UIImageView *)[collectioViewCell viewWithTag:501];
        UILabel *itemName = (UILabel *)[collectioViewCell viewWithTag:502];
        UILabel *itemPrice = (UILabel *)[collectioViewCell viewWithTag:503];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        itemImage.image=[UIImage imageWithData:data];
        itemName.text=[individualData valueForKey:@"itemName"];
        itemPrice.text = [self showPrice:[[individualData valueForKey:@"price"]doubleValue]];
        
        return collectioViewCell;
    }
  
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView==self.tvCollectionView){
        return tvCategory.count;
    }else if (collectionView==self.laptopCollectionView){
        return laptopCategoryItemsList.count;
    }else if(collectionView==self.desktopCollectionView){
        return desktopCategoryItemsList.count;
    }else if(collectionView==self.mobileCollectionView){
        return mobileCategoryItemsList.count;
    }else{
        return tabletCategoryItemsList.count;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SingleItemViewController *singleItemView =[self.storyboard instantiateViewControllerWithIdentifier:@"singleItemViewStoryBoardIdentifier"];
    // tvCollectionView; laptopCollectionView; desktopCollectionView; mobileCollectionView; tabletCollectionView;
    if (collectionView==self.tvCollectionView){
        NSObject *individualData= [tvCategory objectAtIndex:indexPath.row];
        
        singleItemView.itemObjectReceived = [tvCategory objectAtIndex:indexPath.row];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];
    }else if (collectionView==self.laptopCollectionView){
        NSObject *individualData= [laptopCategoryItemsList objectAtIndex:indexPath.row];
        
        singleItemView.itemObjectReceived = [laptopCategoryItemsList objectAtIndex:indexPath.row];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];
    }else if (collectionView==self.desktopCollectionView){
        NSObject *individualData= [desktopCategoryItemsList objectAtIndex:indexPath.row];
        
        singleItemView.itemObjectReceived = [desktopCategoryItemsList objectAtIndex:indexPath.row];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];
    }else if (collectionView==self.mobileCollectionView){
        NSObject *individualData= [mobileCategoryItemsList objectAtIndex:indexPath.row];
        
        singleItemView.itemObjectReceived = [mobileCategoryItemsList objectAtIndex:indexPath.row];
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];
    }else{
        NSObject *individualData= [tabletCategoryItemsList objectAtIndex:indexPath.row];
        
        singleItemView.itemObjectReceived = [tabletCategoryItemsList objectAtIndex:indexPath.row];
        
        NSURL *url = [NSURL URLWithString: [individualData valueForKey:@"photoURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        singleItemView.setItemImage = data;
        singleItemView.setItemName = [individualData valueForKey:@"itemName"];
        singleItemView.setItemCategory = [individualData valueForKey:@"itemCategory"];
        singleItemView.setItemID = [individualData valueForKey:@"ID"];
        singleItemView.setItemPrice = [individualData valueForKey:@"price"];
        singleItemView.setItemBrand = [individualData valueForKey:@"brand"];
        singleItemView.setItemQuality = [individualData valueForKey:@"quality"];
    }
    
    
    [self.navigationController pushViewController:singleItemView animated:YES];
}
-(NSString *)showPrice:(double)price{
    NSString *tempPriceString = [[NSNumber numberWithDouble:price] stringValue];
    NSString *priceString = [NSString stringWithFormat:@"$%@",tempPriceString];
    return priceString;
}
-(void)viewDidAppear:(BOOL)animated{
    sliderTimer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runImages) userInfo:nil repeats:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
    if (sliderTimer) {
        [sliderTimer invalidate];
        sliderTimer=nil;
    }
}
-(void)runImages{
    sliderCustomPageControl.currentPage=sliderIndex;
    if (sliderIndex==sliderImagesData.count-1) {
        sliderIndex=0;
    }else{
        sliderIndex++;
    }
    [self TAPageControl:sliderCustomPageControl didSelectPageAtIndex:sliderIndex];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
}
#pragma mark - ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)sliderScrollView
{
    NSInteger pageIndex = sliderScrollView.contentOffset.x / CGRectGetWidth(sliderScrollView.frame);
    sliderCustomPageControl.currentPage = pageIndex;
    sliderIndex=pageIndex;
}
// Example of use of delegate for second scroll view to respond to bullet touch event
- (void)TAPageControl:(TAPageControl *)pageControl didSelectPageAtIndex:(NSInteger)currentIndex
{
    sliderIndex=currentIndex;
    [sliderScrollView scrollRectToVisible:CGRectMake(CGRectGetWidth(self.view.frame) * currentIndex, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(sliderScrollView.frame)) animated:YES];
}
- (IBAction)televisionCategoryButton:(UIButton *)sender {
    CategoryItemsViewController *categoryItemsView = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryItemViewStoryBoardIdentifier"];
    categoryItemsView.receivedCategoryItemsList = tvCategory;
    categoryItemsView.receivedCategoryName=@"Television";
    [self.navigationController pushViewController:categoryItemsView animated:YES];
}

- (IBAction)laptopCategoryButton:(UIButton *)sender {
    CategoryItemsViewController *categoryItemsView = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryItemViewStoryBoardIdentifier"];
    categoryItemsView.receivedCategoryItemsList = laptopCategoryItemsList;
    categoryItemsView.receivedCategoryName=@"Laptop";
    [self.navigationController pushViewController:categoryItemsView animated:YES];
}

- (IBAction)desktopCategoryButton:(UIButton *)sender {
    CategoryItemsViewController *categoryItemsView = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryItemViewStoryBoardIdentifier"];
    categoryItemsView.receivedCategoryItemsList = desktopCategoryItemsList;
    categoryItemsView.receivedCategoryName=@"Desktop";
    [self.navigationController pushViewController:categoryItemsView animated:YES];
}

- (IBAction)mobileCategoryButton:(UIButton *)sender {
    CategoryItemsViewController *categoryItemsView = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryItemViewStoryBoardIdentifier"];
    categoryItemsView.receivedCategoryItemsList = mobileCategoryItemsList;
    categoryItemsView.receivedCategoryName=@"Mobile";
    [self.navigationController pushViewController:categoryItemsView animated:YES];
}

- (IBAction)tabletCategoryButton:(UIButton *)sender {
    CategoryItemsViewController *categoryItemsView = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryItemViewStoryBoardIdentifier"];
    categoryItemsView.receivedCategoryItemsList = tabletCategoryItemsList;
    categoryItemsView.receivedCategoryName=@"Tablet";
    [self.navigationController pushViewController:categoryItemsView animated:YES];
}
@end
