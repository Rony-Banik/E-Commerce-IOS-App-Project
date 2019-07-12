//
//  AccountViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UILabel *lastName;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *country;
@property (strong, nonatomic) IBOutlet UILabel *state;
@property (strong, nonatomic) IBOutlet UILabel *city;
@property (strong, nonatomic) IBOutlet UILabel *postalCode;
@property (strong, nonatomic) IBOutlet UILabel *address;
- (IBAction)theEditButtonForLoginOrEdit:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *firstNameOutlet;
@property (strong, nonatomic) IBOutlet UILabel *lastNameOutlet;

@property (strong, nonatomic) IBOutlet UILabel *emailOutlet;
@property (strong, nonatomic) IBOutlet UILabel *countryOutlet;
@property (strong, nonatomic) IBOutlet UILabel *stateOutlet;
@property (strong, nonatomic) IBOutlet UILabel *cityOutlet;
@property (strong, nonatomic) IBOutlet UILabel *postalCodeOutlet;
@property (strong, nonatomic) IBOutlet UILabel *addressOutlet;

@property (strong, nonatomic) IBOutlet UIButton *goToLoginButtonOutlet;
@property (strong, nonatomic) IBOutlet UILabel *phoneOutlet;

- (IBAction)goToLoginButton:(id)sender;
- (IBAction)userLogoutButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *userLogOutOutlet;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *userHistoryOutlet;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editUserAccountOutlet;

@property UIAlertController *loggedOutAlert;
@end

NS_ASSUME_NONNULL_END
