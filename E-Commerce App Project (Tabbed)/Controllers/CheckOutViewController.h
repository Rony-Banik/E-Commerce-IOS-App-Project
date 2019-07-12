//
//  CheckOutViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 16/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"
#import <MessageUI/MessageUI.h>


NS_ASSUME_NONNULL_BEGIN

@interface CheckOutViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) ShoppingCart *checkoutCart;

@property (strong, nonatomic) IBOutlet UILabel *checkOutTotalAmount;
@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UILabel *lastName;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *country;
@property (strong, nonatomic) IBOutlet UILabel *city;
@property (strong, nonatomic) IBOutlet UILabel *State;
@property (strong, nonatomic) IBOutlet UILabel *postalCode;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UIButton *bkashOutlet;
@property (strong, nonatomic) IBOutlet UIButton *rocketOutlet;
@property (strong, nonatomic) IBOutlet UIButton *cashOnDeliveryOutlet;

- (IBAction)bkashAction:(id)sender;

- (IBAction)rocketAction:(id)sender;

- (IBAction)cashOnDeliveryAction:(id)sender;

@property BOOL bkashChecked;
@property BOOL rocketChecked;
@property BOOL cashOnDeliveryChecked;

- (IBAction)finishCheckOutButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
