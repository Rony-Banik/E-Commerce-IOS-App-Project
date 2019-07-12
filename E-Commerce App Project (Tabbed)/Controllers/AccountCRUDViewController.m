//
//  AccountCRUDViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 12/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "AccountCRUDViewController.h"
#import "AccountOperations.h"
#import "Validation.h"

@interface AccountCRUDViewController (){
    AccountOperations *accountOperationsObj;
    Validation *validatorObj;
    //For Edit/Update Account
    NSUserDefaults *defaults;
    NSDictionary *userData;
}

@end

@implementation AccountCRUDViewController

@synthesize firstName,lastName,email,password,confirmPassword,phone,country,state,city,postalCode,address,validationStatus;

//For Edit Account
@synthesize editAccountFirstName,editAccountLastName,editAccountEmail,editAccountPassword,editAccountConfirmPassword,editAccountPhone,editAccountCountry,editAccountState,editAccountCity,editAccountPostalCode,editAccountAddress,editAccountValidationStatus;
@synthesize registrationComplete;

- (void)viewDidLoad {
    [super viewDidLoad];
    validationStatus.hidden=YES;
    accountOperationsObj = [[AccountOperations alloc]init];
    validatorObj = [[Validation alloc]init];
    
    
    [firstName ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"First Name is Required!" IntegerforMinLength:1 minLengthErrorMessage:@"It has to be something at least!" withLabelForValidationRules:validationStatus]];
    [editAccountFirstName ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"First Name is Required!" IntegerforMinLength:1 minLengthErrorMessage:@"It has to be something at least!" withLabelForValidationRules:validationStatus]];
    
    [lastName ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"Last Name is Required!" IntegerforMinLength:1 minLengthErrorMessage:@"Last Name Please!" withLabelForValidationRules:validationStatus]];
    [editAccountLastName ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"Last Name is Required!" IntegerforMinLength:1 minLengthErrorMessage:@"Last Name Please!" withLabelForValidationRules:validationStatus]];
    
    [phone ajw_attachValidator:[validatorObj phoneValidator:validationStatus]];
    [editAccountPhone ajw_attachValidator:[validatorObj phoneValidator:validationStatus]];
    
    [email ajw_attachValidator:[validatorObj emailValidator:validationStatus]];
    [editAccountEmail ajw_attachValidator:[validatorObj emailValidator:validationStatus]];
    
    [password ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"Password is required!" IntegerforMinLength:6 minLengthErrorMessage:@"It must be at least 6 charecters!" withLabelForValidationRules:validationStatus]];
    
    [editAccountPassword ajw_attachValidator:[validatorObj requiredMinLengthValidator:@"Password is required!" IntegerforMinLength:6 minLengthErrorMessage:@"It must be at least 6 charecters!" withLabelForValidationRules:validationStatus]];
    [confirmPassword ajw_attachValidator:[validatorObj requiredValidator:@"Required and Should be same as 'Password'" withLabelForValidationRules:validationStatus]];
    [editAccountConfirmPassword ajw_attachValidator:[validatorObj requiredValidator:@"Required and Should be same as 'Password'" withLabelForValidationRules:validationStatus]];
    [country ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [state ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [city ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [postalCode ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [address ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [editAccountCountry ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [editAccountState ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [editAccountCity ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [editAccountPostalCode ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    [editAccountAddress ajw_attachValidator:[validatorObj requiredValidator:@"Required!" withLabelForValidationRules:validationStatus]];
    
        defaults = [NSUserDefaults standardUserDefaults];
        if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
            NSLog(@"user not logged IN");
        }else{
            NSLog(@"%@",[defaults valueForKey:@"LoggedInUsersDetail"]);
            userData = [defaults dictionaryForKey:@"LoggedInUsersDetail"];
            
            editAccountFirstName.text=[userData valueForKey:@"firstName"];
            editAccountLastName.text=[userData valueForKey:@"lastName"];
            editAccountEmail.text=[userData valueForKey:@"usersEmail"];
            editAccountPhone.text=[userData valueForKey:@"phone"];
            editAccountCountry.text=[userData valueForKey:@"country"];
            editAccountState.text=[userData valueForKey:@"state"];
            editAccountCity.text=[userData valueForKey:@"city"];
            editAccountPostalCode.text=[userData valueForKey:@"postalCode"];
            editAccountAddress.text=[userData valueForKey:@"address"];
        }
    
    
    registrationComplete = [UIAlertController
                      alertControllerWithTitle:@"Registered!"
                      message:@"You've Successfully Registered!"
                      preferredStyle:UIAlertControllerStyleAlert];
    
    // Do any additional setup after loading the view.
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Log In!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                }];
    
    [registrationComplete addAction:yesButton];
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)registrationAction:(id)sender{
    NSString *encryptedPassword = [accountOperationsObj sha1:password.text];
    NSString *encryptedConfirmedPassword = [accountOperationsObj sha1:confirmPassword.text];
    NSString *secureKeyForServerAccess = @"sdfsdfsd38792F423F4528482B4D6250655368566D597133743677397A24432646294A40kjsdhfkjsdhf";
    NSDictionary *dataToSend = [NSDictionary dictionaryWithObjectsAndKeys:
                                secureKeyForServerAccess,@"secureKeyForServerAccess_Enabled",
                                @"REGISTER_USER",@"actionRequest",firstName.text, @"firstName",
                                lastName.text, @"lastName",email.text,@"email",
                                encryptedPassword,@"password",
                                encryptedConfirmedPassword,@"confirmPassword",
                                phone.text,@"phone",country.text,@"country",
                                state.text,@"state",city.text,@"city",
                                postalCode.text,@"postalCode",address.text,@"address",
                                nil];
    [accountOperationsObj sendRequestToServer:dataToSend callback:^(NSError *error, BOOL success, NSString *customErrorMessage){
        if (success) {
            if([customErrorMessage isEqualToString:@"Registraition Successful"]){
                [sender setTitle:@"Registered" forState:UIControlStateNormal];
                [sender setBackgroundColor:[UIColor blueColor]];
                [self presentViewController:self->registrationComplete animated:YES completion:nil];
            }else{
                [self generalAlerts:@"Alert!" withMessage:customErrorMessage withYesActionTitle:@"Cancel Registration!" withNoActionTitle:@"Fix it!"];
            }
        }else{
            [self generalAlerts:@"Alert!" withMessage:customErrorMessage withYesActionTitle:@"Cancel Registration!" withNoActionTitle:@"Fix it!"];
            [sender setTitle:@"Try Again" forState:UIControlStateNormal];
        }
    }];
}

- (IBAction)registerAccount:(id)sender {
    //firstName,lastName,email,password,confirmPassword,phone,country,state,city,postalCode,address;
    if ([firstName hasText]&&[lastName hasText]&&[email hasText]&&[password hasText]&&[confirmPassword hasText]&&[phone hasText]&&[country hasText]&&[state hasText]&&[city hasText]&&[postalCode hasText]&&[address hasText]) {
            if ([accountOperationsObj validateEmailAccount:email.text]) {
                if ([password.text isEqualToString:confirmPassword.text]) {
                    [self registrationAction:sender];
                }else{
                    [self generalAlerts:@"Password Mismatch!" withMessage:@"Confirm password and password Must be same" withYesActionTitle:@"Log In!" withNoActionTitle:@"Back To Form!"];
                }
            }else{
                [self generalAlerts:@"Invalid Email!" withMessage:@"Please Insert a valid email address" withYesActionTitle:@"Cancel Registration!" withNoActionTitle:@"Ok!"];
            }
    }else{
        [self generalAlerts:@"Empty Form" withMessage:@"Please complete the form!" withYesActionTitle:@"Already Registered!" withNoActionTitle:@"Got it!"];
    }
}
-(void)editAction:(id)sender{
    NSString *encryptedPassword = [accountOperationsObj sha1:editAccountPassword.text];
    NSString *encryptedConfirmedPassword = [accountOperationsObj sha1:editAccountConfirmPassword.text];
    NSString *secureKeyForServerAccess = @"sdfsdfsd38792F423F4528482B4D6250655368566D597133743677397A24432646294A40kjsdhfkjsdhf";
    NSDictionary *dataToSend = [NSDictionary dictionaryWithObjectsAndKeys:
                                secureKeyForServerAccess,@"secureKeyForServerAccess_Enabled",
                                @"EDIT_USER",@"actionRequest",editAccountFirstName.text, @"firstName",
                                editAccountLastName.text, @"lastName",[userData valueForKey:@"usersEmail"],@"email",
                                encryptedPassword,@"password",
                                encryptedConfirmedPassword,@"confirmPassword",
                                editAccountPhone.text,@"phone",editAccountCity.text,@"country",
                                editAccountState.text,@"state",editAccountCity.text,@"city",
                                editAccountPostalCode.text,@"postalCode",editAccountAddress.text,@"address",
                                nil];
    [accountOperationsObj sendRequestToServer:dataToSend callback:^(NSError *error, BOOL success, NSString* customErrorMessage){
        if (success) {
            if([customErrorMessage isEqualToString:@"Update Successful"]){
                [sender setTitle:@"Account Updated!" forState:UIControlStateNormal];
                [sender setBackgroundColor:[UIColor blueColor]];
                [self generalAlerts:@"Account Updated!" withMessage:@"Your Account Have Successfully Updated!" withYesActionTitle:@"Log In!" withNoActionTitle:@"OK"];
                [self presentViewController:self->registrationComplete animated:YES completion:nil];
            }else{
                [self generalAlerts:@"Alert!" withMessage:customErrorMessage withYesActionTitle:@"Cancel Updating!" withNoActionTitle:@"Fix it!"];
            }
        }else{
            [self generalAlerts:@"Alert!" withMessage:customErrorMessage withYesActionTitle:@"Cancel Updating!" withNoActionTitle:@"Fix it!"];
            [sender setTitle:@"Try Again" forState:UIControlStateNormal];
            [sender setBackgroundColor:[UIColor redColor]];
        }
    }];
}
- (IBAction)editAccount:(id)sender {
    //firstName,lastName,email,password,confirmPassword,phone,country,state,city,postalCode,address;
    if ([editAccountFirstName hasText]&&[editAccountLastName hasText]&&[editAccountEmail hasText]&&[editAccountPassword hasText]&&[editAccountConfirmPassword hasText]&&[editAccountPhone hasText]&&[editAccountCountry hasText]&&[editAccountState hasText]&&[editAccountCity hasText]&&[editAccountPostalCode hasText]&&[editAccountAddress hasText]) {
        
            if ([accountOperationsObj validateEmailAccount:editAccountEmail.text]) {
                if ([editAccountPassword.text isEqualToString:editAccountConfirmPassword.text]) {
                    [self editAction:sender];
                }else{
                    [self generalAlerts:@"Password Mismatch!" withMessage:@"Confirm password and password Must be same" withYesActionTitle:@"Cancel Updating!" withNoActionTitle:@"Back To Form!"];
                }
            }else{
                [self generalAlerts:@"Invalid Email!" withMessage:@"Please Insert a valid email address" withYesActionTitle:@"Cancel Updating!" withNoActionTitle:@"Ok!"];
            }
        
    }else{
        [self generalAlerts:@"Empty Form" withMessage:@"Please complete the form!" withYesActionTitle:@"Cancel Updating!" withNoActionTitle:@"Got it!"];
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
    UIAlertAction* yesAction = [UIAlertAction
                                actionWithTitle:yesActionTitle
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                }];
    UIAlertAction* noAction = [UIAlertAction
                                   actionWithTitle:noActionTitle
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       
                                   }];
    [generalAlert addAction:yesAction];
    [generalAlert addAction:noAction];
    [self presentViewController:generalAlert animated:YES completion:nil];
}
@end
