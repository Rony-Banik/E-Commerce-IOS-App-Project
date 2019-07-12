//
//  CartViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"

NS_ASSUME_NONNULL_BEGIN

@interface CartViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) ShoppingCart *checkoutCart;

@property (strong, nonatomic) UIImageView *itemImage;
@property (strong, nonatomic) UILabel *itemName;
@property (strong, nonatomic) UILabel *itemPrice;
@property (strong, nonatomic) UILabel *itemQuantity;
@property (strong, nonatomic) NSString *itemQuantityInText;
@property (strong, nonatomic) IBOutlet UILabel *totalAmountLabelOutlet;

@property (strong, nonatomic) IBOutlet UILabel *totalAmountShowOutlet;

@property (strong, nonatomic) NSString *updatedSingleItemPriceText;

@property (strong, nonatomic) IBOutlet UITableView *cartTableView;

@property (strong, nonatomic) UIStepper *quantityStepper;

- (IBAction)stepperClicked:(UIStepper *)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editCartButtonOutlet;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cartContinueButtonOutlet;

- (IBAction)editCartButton:(id)sender;
- (IBAction)CartContinueButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
