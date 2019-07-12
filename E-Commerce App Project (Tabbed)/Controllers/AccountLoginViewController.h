//
//  AccountLoginViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 15/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *loginFormEmail;
@property (strong, nonatomic) IBOutlet UITextField *loginFormPassword;

- (IBAction)loginFormSignInButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *validationStatusLabel;

@end

NS_ASSUME_NONNULL_END
