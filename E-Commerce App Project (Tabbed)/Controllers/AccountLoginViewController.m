//
//  AccountLoginViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 15/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "AccountLoginViewController.h"
#import "AccountOperations.h"
#import "Validation.h"

@interface AccountLoginViewController (){
    AccountOperations* accountOperationsObj;
    Validation *validatorObj;
}

@end

@implementation AccountLoginViewController
@synthesize loginFormEmail;
@synthesize loginFormPassword;
@synthesize validationStatusLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    accountOperationsObj = [[AccountOperations alloc]init];
    validatorObj = [[Validation alloc]init];
    [loginFormEmail ajw_attachValidator:[validatorObj emailValidator:validationStatusLabel]];
    
    [loginFormPassword ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"Insert Your Password!" IntegerforMinLength:1 minLengthErrorMessage:@"It can't be just nothing!" withLabelForValidationRules:validationStatusLabel]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)LoginAction:(id)sender{
    NSString *encryptedPassword = [accountOperationsObj sha1:loginFormPassword.text];
    
    NSString *secureKeyForServerAccess = @"sdfsdfsd38792F423F4528482B4D6250655368566D597133743677397A24432646294A40kjsdhfkjsdhf";
    NSDictionary *dataToSend = [NSDictionary dictionaryWithObjectsAndKeys:
                                secureKeyForServerAccess,@"secureKeyForServerAccess_Enabled",
                                @"CHECK_USER_LOGIN",@"actionRequest",loginFormEmail.text,@"email",
                                encryptedPassword,@"password",
                                nil];
    [accountOperationsObj sendRequestToServer:dataToSend callback:^(NSError *error, BOOL success, NSString *customErrorMessage){
        if (success) {
            if([customErrorMessage isEqualToString:@"Login Successful"]){
                [sender setTitle:@"Logged In" forState:UIControlStateNormal];
                [sender setBackgroundColor:[UIColor greenColor]];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                [self generalAlerts:@"Alert!" withMessage:customErrorMessage withYesActionTitle:@"Cancel Log In!" withNoActionTitle:@"Back to Login!"];
            }
        }else{
            [self generalAlerts:@"Not Logged In!" withMessage:@"Something went wrong please try again!" withYesActionTitle:@"Cancel Log In" withNoActionTitle:@"Ok!"];
            [sender setTitle:@"Try Again" forState:UIControlStateNormal];
        }
    }];
}
- (IBAction)loginFormSignInButton:(id)sender {
    
    if ([loginFormEmail hasText]&&[loginFormPassword hasText]) {
        if ([accountOperationsObj validateEmailAccount:loginFormEmail.text]) {
            [self LoginAction:sender];
        }else{
            [self generalAlerts:@"Invalid Email!" withMessage:@"Please Insert a valid email address" withYesActionTitle:@"Cancel Log In" withNoActionTitle:@"Ok!"];
        }
    }else{
        [self generalAlerts:@"Empty Form!" withMessage:@"Give your Email and Password" withYesActionTitle:@"Cancel Log In" withNoActionTitle:@"Ok!"];
    }
}

-(void)generalAlerts:(NSString *)alertTitle
         withMessage:(NSString *)alertMessage
  withYesActionTitle:(NSString *)yesActionTitle
   withNoActionTitle:(NSString *)noActionTitle{
    
    UIAlertController *generalAlert;
    generalAlert = [UIAlertController
                    alertControllerWithTitle:alertTitle
                    message:alertMessage
                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* noAction = [UIAlertAction
                               actionWithTitle:yesActionTitle
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                                   [self.navigationController popToRootViewControllerAnimated:YES];
                               }];
    UIAlertAction* yesAction = [UIAlertAction
                                actionWithTitle:noActionTitle
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    
                                }];
    [generalAlert addAction:yesAction];
    [generalAlert addAction:noAction];
    [self presentViewController:generalAlert animated:YES completion:nil];
}
@end
