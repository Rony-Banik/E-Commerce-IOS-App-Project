//
//  SingleItemViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 10/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleItemViewController : ViewController
// NSString *itemName; NSString* photoURL; NSString* quality; NSString* itemCategory; NSString* brand; NSString* price; NSNumber* sale; NSNumber* ID;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UILabel *itemCategory;
@property (strong, nonatomic) IBOutlet UILabel *itemID;
@property (strong, nonatomic) IBOutlet UILabel *itemPrice;
@property (strong, nonatomic) IBOutlet UILabel *itemBrand;
@property (strong, nonatomic) IBOutlet UILabel *itemQuality;
- (IBAction)addToCartButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *addToCartStatusoutlet;
- (IBAction)removeFromCartButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *removeFromCartOutlet;



@property NSData *setItemImage;
@property NSString *setItemName;
@property NSString *setItemCategory;
@property NSNumber *setItemID;
@property NSNumber *setItemPrice;
@property NSString *setItemBrand;
@property NSString *setItemQuality;
@property double *setCartAddedQuantity;

@property UIAlertController* itemAlreadyAddedAlert;

@property (strong, nonatomic) Item *itemObjectReceived;
@property (strong, nonatomic) Item *theItemObject;


@end

NS_ASSUME_NONNULL_END
