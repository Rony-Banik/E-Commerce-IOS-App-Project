//
//  AccountCRUDViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 12/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountCRUDViewController : UIViewController{
    NSString *databasePath;
    sqlite3 *userInfoDatabase;
}
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *country;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UILabel *validationStatus;

- (IBAction)registerAccount:(id)sender;

@property UIAlertController* userAlreadyRegistered;

@property (strong, nonatomic) IBOutlet UITextField *editAccountFirstName;
@property (strong, nonatomic) IBOutlet UITextField *editAccountLastName;
@property (strong, nonatomic) IBOutlet UITextField *editAccountEmail;
@property (strong, nonatomic) IBOutlet UITextField *editAccountPassword;
@property (strong, nonatomic) IBOutlet UITextField *editAccountConfirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *editAccountPhone;
@property (strong, nonatomic) IBOutlet UITextField *editAccountCountry;
@property (strong, nonatomic) IBOutlet UITextField *editAccountState;
@property (strong, nonatomic) IBOutlet UITextField *editAccountCity;
@property (strong, nonatomic) IBOutlet UITextField *editAccountPostalCode;
@property (strong, nonatomic) IBOutlet UITextField *editAccountAddress;
@property (strong, nonatomic) IBOutlet UILabel *editAccountValidationStatus;
- (IBAction)editAccount:(id)sender;

@property UIAlertController *registrationComplete;
@end

NS_ASSUME_NONNULL_END
