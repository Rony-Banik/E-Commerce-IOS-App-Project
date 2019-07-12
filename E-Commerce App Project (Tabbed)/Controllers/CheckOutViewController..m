//
//  CheckOutViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 16/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "CheckOutViewController.h"

#define A4PaperSize CGRectMake(0,0,595.2,841.8);

@interface CheckOutViewController (){
    NSUserDefaults *defaults;
    NSDictionary *userData;
    NSString *PDFFilePath;
    UIAlertController *paymentAlert;
}

@end

@implementation CheckOutViewController

@synthesize checkOutTotalAmount,firstName,lastName,email,phone,country,city,State,postalCode,address,bkashOutlet,rocketOutlet,cashOnDeliveryOutlet;
@synthesize bkashChecked,rocketChecked,cashOnDeliveryChecked;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.checkoutCart = [ShoppingCart sharedInstance];
    
    
    paymentAlert = [UIAlertController
                    alertControllerWithTitle:@"Payment Method Not Selected"
                    message:@"Please Choose your payment method From the Payment Method Section"
                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesAction = [UIAlertAction
                                actionWithTitle:@"OK!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    
                                }];
    [paymentAlert addAction:yesAction];
    
    bkashChecked = NO;
    rocketChecked = NO;
    cashOnDeliveryChecked = NO;
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
        checkOutTotalAmount.text=@"";
        firstName.text=@"";
        lastName.text=@"";
        email.text=@"";
        phone.text=@"";
        country.text=@"";
        city.text=@"";
        State.text=@"";
        postalCode.text=@"";
        address.text=@"";
        bkashOutlet.hidden=YES;
        rocketOutlet.hidden=YES;
        cashOnDeliveryOutlet.hidden=YES;
    }else{
        bkashOutlet.hidden=NO;
        rocketOutlet.hidden=NO;
        cashOnDeliveryOutlet.hidden=NO;
        userData = [defaults dictionaryForKey:@"LoggedInUsersDetail"];
        
        checkOutTotalAmount.text = [NSString stringWithFormat:@"$%@",[defaults valueForKey:@"cartTotalAmount"]];
        firstName.text=[userData valueForKey:@"firstName"];
        lastName.text=[userData valueForKey:@"lastName"];
        email.text=[userData valueForKey:@"usersEmail"];
        phone.text=[userData valueForKey:@"phone"];
        country.text=[userData valueForKey:@"country"];
        city.text=[userData valueForKey:@"city"];
        State.text=[userData valueForKey:@"state"];
        postalCode.text=[userData valueForKey:@"postalCode"];
        address.text=[userData valueForKey:@"address"];
    }
    
    // Do any additional setup after loading the view.
    // NS userDefaults has all the values needed
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bkashAction:(id)sender {
    if (!bkashChecked) {
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxChecked-icon-40.png"] forState:UIControlStateNormal];
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        bkashChecked = YES;
        rocketChecked = NO;
        cashOnDeliveryChecked = NO;
        [defaults setObject:@"Bkash" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }else if(bkashChecked){
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        bkashChecked = NO;
        rocketChecked = NO;
        cashOnDeliveryChecked = NO;
        [defaults setObject:@"" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }
}

- (IBAction)rocketAction:(id)sender {
    if (!rocketChecked) {
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxChecked-icon-40.png"] forState:UIControlStateNormal];
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        rocketChecked = YES;
        bkashChecked = NO;
        cashOnDeliveryChecked = NO;
        [defaults setObject:@"Rocket" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }else if(rocketChecked){
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        bkashChecked = NO;
        rocketChecked = NO;
        cashOnDeliveryChecked = NO;
        [defaults setObject:@"" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }
}

- (IBAction)cashOnDeliveryAction:(id)sender {
    if (!cashOnDeliveryChecked) {
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxChecked-icon-40.png"] forState:UIControlStateNormal];
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        cashOnDeliveryChecked = YES;
        rocketChecked = NO;
        bkashChecked = NO;
        [defaults setObject:@"Cash On Delivery" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }else if(cashOnDeliveryChecked){
        [bkashOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [rocketOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        [cashOnDeliveryOutlet setImage:[UIImage imageNamed:@"checkboxUnchecked-icon-40.png"] forState:UIControlStateNormal];
        bkashChecked = NO;
        rocketChecked = NO;
        cashOnDeliveryChecked = NO;
        [defaults setObject:@"" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
    }
}
-(NSString*)getHTMLString{
   
    NSString *pdfLogoUrl = @"https://apiforios.appendtech.com/logo.png";
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"invoice" ofType:@"html"];
    NSString *singleItemFilePath = [[NSBundle mainBundle] pathForResource:@"single_item" ofType:@"html"];
    
    NSString *strHTML = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *itemsInCartArray = self.checkoutCart.itemsInCart;
    
    NSMutableArray *allItemsHTMLArray=[[NSMutableArray alloc]init];
    NSString *allItemsHTMLString;
    for (int i=0; i<itemsInCartArray.count; i++) {
        NSString *srtItemHTML = [NSString stringWithContentsOfFile:singleItemFilePath encoding:NSUTF8StringEncoding error:nil];
        srtItemHTML = [srtItemHTML stringByReplacingOccurrencesOfString:@"#productName" withString:[itemsInCartArray[i] itemName]];
        srtItemHTML = [srtItemHTML stringByReplacingOccurrencesOfString:@"#quantity" withString:[[NSNumber numberWithDouble:[itemsInCartArray[i] cartAddedQuantity]] stringValue]];
        srtItemHTML = [srtItemHTML stringByReplacingOccurrencesOfString:@"#price" withString:[[NSNumber numberWithDouble:[itemsInCartArray[i] price]] stringValue]];
        
        [allItemsHTMLArray addObject:srtItemHTML];
    }
    allItemsHTMLString = [allItemsHTMLArray componentsJoinedByString:@"\n"];
    
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:allItemsHTMLString];
    
    NSDate *date= [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMM d, yyyy"];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSString *ownerInfo = @"ICTcom<br>An E-commerce App Project<br>Developed BY: Rony Banik (Arko)<br>";
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#ownerInfo" withString:ownerInfo];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#appIcon" withString:pdfLogoUrl];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#invoiceDate" withString:dateString];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#cartTotal" withString:[defaults valueForKey:@"cartTotalAmount"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#firstName" withString:[userData valueForKey:@"firstName"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#lastName" withString:[userData valueForKey:@"lastName"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#email" withString:[userData valueForKey:@"usersEmail"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#phone" withString:[userData valueForKey:@"phone"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#country" withString:[userData valueForKey:@"country"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#city" withString:[userData valueForKey:@"city"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#state" withString:[userData valueForKey:@"state"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#postalCode" withString:[userData valueForKey:@"postalCode"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#address" withString:[userData valueForKey:@"address"]];
    strHTML = [strHTML stringByReplacingOccurrencesOfString:@"#paymentMethod" withString:[defaults valueForKey:@"paymentMethodUsed"]];
    
    return strHTML;
}

-(void)savePDF{
    CGRect pageFrame = A4PaperSize;
    
    UIPrintPageRenderer *printPageRenderer = [[UIPrintPageRenderer alloc]init];
    [printPageRenderer setValue:[NSValue valueWithCGRect:pageFrame] forKey:@"paperRect"];
    [printPageRenderer setValue:[NSValue valueWithCGRect:pageFrame] forKey:@"printableRect"];
    UIPrintFormatter *printFormatter = [[UIMarkupTextPrintFormatter alloc]initWithMarkupText:[self getHTMLString]];
    [printPageRenderer addPrintFormatter:printFormatter startingAtPageAtIndex:0];
    
    NSMutableData *pdfData = [[NSMutableData alloc]init];
    
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, nil);
    UIGraphicsBeginPDFPage();
    [printPageRenderer drawPageAtIndex:0 inRect:UIGraphicsGetPDFContextBounds()];
    UIGraphicsEndPDFContext();
    PDFFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)objectAtIndex:0];
    PDFFilePath = [PDFFilePath stringByAppendingString:@"/invoiceFromICTcom.pdf"];
    [pdfData writeToFile:PDFFilePath atomically:true];
    NSLog(@"Filepath: %@",PDFFilePath);
    [defaults setObject:PDFFilePath forKey:@"pdfFilePath"];
    [defaults synchronize];
}
- (IBAction)finishCheckOutButton:(id)sender {
    if ([[defaults valueForKey:@"paymentMethodUsed"] isEqualToString:@""]){
        [self presentViewController:paymentAlert animated:YES completion:nil];
    }else{
        [self savePDF];
        [self sendMailWithPDF];
        [defaults setObject:@"" forKey:@"cartTotalAmount"];
        [defaults setObject:@"" forKey:@"paymentMethodUsed"];
        [defaults synchronize];
        [self.checkoutCart clearCart];
        [self performSegueWithIdentifier:@"checkoutToThankyouSegue" sender:nil];
    }
}

-(void)sendMailWithPDF{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *saleMail = [[MFMailComposeViewController alloc] init];
        saleMail.mailComposeDelegate = self;
        [saleMail setSubject:@"Invoice From ICTcom App"];
        [saleMail setMessageBody:@"Thanks so much for your purchase.<br>Please find the attached invoice.<br>Thanks From ICTcom" isHTML:YES];
        NSData *contentsOfFile = [[NSData alloc]initWithContentsOfFile:PDFFilePath];
        
        [saleMail addAttachmentData:contentsOfFile mimeType:@"application/pdf" fileName:@"Invoice"];
        
        [saleMail setToRecipients:[userData valueForKey:@"usersEmail"]];  //Set a test email
        
        [self presentViewController:saleMail animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"Device can't send email! maybe Simulator");
    }
}
@end
