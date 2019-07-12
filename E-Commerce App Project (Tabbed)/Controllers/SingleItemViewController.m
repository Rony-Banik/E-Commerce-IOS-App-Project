//
//  SingleItemViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "SingleItemViewController.h"
#import "ShoppingCart.h"

@interface SingleItemViewController (){
    ShoppingCart* checkoutCart;
}

@end

@implementation SingleItemViewController

@synthesize itemImage;
@synthesize itemName;
@synthesize itemCategory;
@synthesize itemID;
@synthesize itemPrice;
@synthesize itemBrand;
@synthesize itemQuality;


@synthesize setItemImage;
@synthesize setItemName;
@synthesize setItemCategory;
@synthesize setItemID;
@synthesize setItemPrice;
@synthesize setItemBrand;
@synthesize setItemQuality;

@synthesize itemObjectReceived;
@synthesize theItemObject;

@synthesize itemAlreadyAddedAlert;


- (void)viewDidLoad {
    [super viewDidLoad];
    checkoutCart = [ShoppingCart sharedInstance];
    self.addToCartStatusoutlet.selected = [checkoutCart containsItem:self.theItemObject] ? YES : NO;
    // Do any additional setup after loading the view.
    theItemObject = itemObjectReceived;
    itemImage.image=[UIImage imageWithData:setItemImage];
    itemName.text=setItemName;
    itemCategory.text=setItemCategory;
    itemID.text=setItemID.stringValue;
    itemPrice.text = [self showPrice:setItemPrice];
    itemBrand.text=setItemBrand;
    itemQuality.text=setItemQuality;
    
    itemAlreadyAddedAlert = [UIAlertController
                                 alertControllerWithTitle:@"Already Added To The Cart"
                                 message:@"Item Will Be Added To Your Cart Again"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Got it!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Add To Cart Again!"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   ShoppingCart* checkoutCart = [ShoppingCart sharedInstance];
                                   [checkoutCart addItem:self.theItemObject];
                                   self.addToCartStatusoutlet.selected = YES;
                               }];
    
    [itemAlreadyAddedAlert addAction:yesButton];
    [itemAlreadyAddedAlert addAction:noButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.addToCartStatusoutlet.selected = [checkoutCart containsItem:self.theItemObject] ? YES : NO;
    if (!self.addToCartStatusoutlet.selected) {
        self.removeFromCartOutlet.hidden=YES;
    }else{
        self.removeFromCartOutlet.hidden=NO;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    if (!self.addToCartStatusoutlet.selected) {
        self.removeFromCartOutlet.hidden=YES;
        [self.addToCartStatusoutlet setTitle:@"Add To Cart" forState:UIControlStateNormal];

    }else{
        self.removeFromCartOutlet.hidden=NO;
        [self.addToCartStatusoutlet setTitle:@"Add To Cart Again" forState:UIControlStateNormal];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToCartButton:(id)sender {
    
    if (!self.addToCartStatusoutlet.selected) {
        [checkoutCart addItem:self.theItemObject];
        self.addToCartStatusoutlet.selected = YES;
        self.removeFromCartOutlet.hidden=NO;
        [sender setTitle:@"Again Add To Cart" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor greenColor]];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        self.removeFromCartOutlet.hidden=NO;
        [self presentViewController:itemAlreadyAddedAlert animated:YES completion:nil];
        [sender setTitle:@"Again Add To Cart" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor greenColor]];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (IBAction)removeFromCartButton:(id)sender {
    [checkoutCart removeItem:self.theItemObject];
    self.addToCartStatusoutlet.selected = NO;
    [sender setTitle:@"Add To Cart" forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"addToCart-icon-40.png"] forState:UIControlStateNormal];
    [sender setBackgroundColor:[UIColor blueColor]];
}

-(NSString *)showPrice:(NSNumber *)price{
    NSString *priceString = [NSString stringWithFormat:@"$%@",price];
    return priceString;
}
@end
