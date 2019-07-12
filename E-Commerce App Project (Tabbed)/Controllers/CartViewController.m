//
//  CartViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "CartViewController.h"
#import "Item.h"
#import "Items.h"
#import "SingleItemViewController.h"


@interface CartViewController ()
{
    double updatedSingleItemPrice;
    NSNumber *updatedSingleItemPriceDoubleValueToNumber;
    double stepperClickedValue;
    BOOL editClicked;
    NSIndexPath *intendedPath;
}
@end

@implementation CartViewController

@synthesize itemImage;
@synthesize itemName;
@synthesize itemPrice;
@synthesize itemQuantity;
@synthesize itemQuantityInText;
@synthesize quantityStepper;
@synthesize cartTableView;
@synthesize totalAmountLabelOutlet,totalAmountShowOutlet;
@synthesize editCartButtonOutlet,cartContinueButtonOutlet;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.checkoutCart = [ShoppingCart sharedInstance];
    [cartTableView reloadData];
    if (!(self.checkoutCart.itemsInCart.count > 0)) {
        editCartButtonOutlet.enabled=NO;
        editCartButtonOutlet.tintColor = [UIColor clearColor];
        cartContinueButtonOutlet.enabled=NO;
        cartContinueButtonOutlet.tintColor=[UIColor clearColor];
        totalAmountLabelOutlet.hidden=YES;
        totalAmountShowOutlet.hidden=YES;
    }else{
        editCartButtonOutlet.enabled=YES;
        editCartButtonOutlet.tintColor = [UIColor colorNamed:@"Cornflower Blue"];
        cartContinueButtonOutlet.enabled=YES;
        cartContinueButtonOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
        totalAmountLabelOutlet.hidden=NO;
        totalAmountShowOutlet.hidden=NO;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [cartTableView reloadData];
    if (!(self.checkoutCart.itemsInCart.count > 0)) {
        editCartButtonOutlet.enabled=NO;
        editCartButtonOutlet.tintColor = [UIColor clearColor];
        cartContinueButtonOutlet.enabled=NO;
        cartContinueButtonOutlet.tintColor=[UIColor clearColor];
        totalAmountLabelOutlet.hidden=YES;
        totalAmountShowOutlet.hidden=YES;
    }else{
        editCartButtonOutlet.enabled=YES;
        editCartButtonOutlet.tintColor = [UIColor colorNamed:@"Cornflower Blue"];
        cartContinueButtonOutlet.enabled=YES;
        cartContinueButtonOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
        totalAmountLabelOutlet.hidden=NO;
        totalAmountShowOutlet.hidden=NO;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [cartTableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        Item *itemObject = self.checkoutCart.itemsInCart[indexPath.row];
        intendedPath=indexPath;
        UITableViewCell *cellIdentifier = [tableView dequeueReusableCellWithIdentifier:@"cartTableViewCellIdentifier"];
       
        itemImage = (UIImageView *)[cellIdentifier viewWithTag:701];
        itemName = (UILabel *)[cellIdentifier viewWithTag:702];
        itemPrice = (UILabel *)[cellIdentifier viewWithTag:703];
        itemQuantity = (UILabel *)[cellIdentifier viewWithTag:704];
        quantityStepper = (UIStepper *)[cellIdentifier viewWithTag:705];
        
        NSURL *url = [NSURL URLWithString:itemObject.photoURL];
        NSData *data = [NSData dataWithContentsOfURL:url];

        itemImage.image = [UIImage imageWithData:data];
        itemName.text = itemObject.itemName;
        quantityStepper.value=itemObject.cartAddedQuantity;
        
        updatedSingleItemPrice = (itemObject.cartAddedQuantity*itemObject.price);
        updatedSingleItemPriceDoubleValueToNumber = [NSNumber numberWithDouble:updatedSingleItemPrice];
        itemPrice.text = [self showPrice:updatedSingleItemPriceDoubleValueToNumber];
        
        itemQuantityInText = [[NSNumber numberWithDouble:itemObject.cartAddedQuantity] stringValue];
        itemQuantity.text = itemQuantityInText;
        totalAmountShowOutlet.text = [self showPrice:[self.checkoutCart total]];
        
        return cellIdentifier;
    }
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0)? self.checkoutCart.itemsInCart.count :1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat heightForRow;
    heightForRow = 100;
    return heightForRow;
}

- (IBAction)stepperClicked:(UIStepper *)sender
            {
    double stepperValue = [sender value];
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:cartTableView];
    NSIndexPath *rowIndexPath = [cartTableView indexPathForRowAtPoint:buttonPosition];
    [self returnStepperValue:rowIndexPath withStepperValue:stepperValue];
}
-(void)returnStepperValue:(NSIndexPath *)indexPath
         withStepperValue:(double)stepperValue{
    Item *itemObject = self.checkoutCart.itemsInCart[indexPath.row];
    itemObject.cartAddedQuantity = stepperValue;
    [cartTableView reloadData];
}

- (IBAction)editCartButton:(id)sender {
    if(editClicked == NO){
        [cartTableView setEditing:YES animated:YES];
        editClicked = YES;
        [cartTableView reloadData];
    }else{
        [cartTableView setEditing:NO animated:YES];
        editClicked = NO;
        [cartTableView reloadData];
    }
}

- (IBAction)CartContinueButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
        [self performSegueWithIdentifier:@"cartToLogInSegue" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"checkOutSegue" sender:nil];
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        Item *itemObject = self.checkoutCart.itemsInCart[indexPath.row];
        [self.checkoutCart removeFromCart:itemObject];
        totalAmountShowOutlet.text=[[self.checkoutCart total] stringValue];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewCellEditingStyleDelete];
    }
}
-(NSString *)showPrice:(NSNumber *)price{
    NSString *priceString = [NSString stringWithFormat:@"$%@",price];
    return priceString;
}
@end
