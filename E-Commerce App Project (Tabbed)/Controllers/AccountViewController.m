//
//  AccountViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 7/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "AccountViewController.h"
#import "AccountOPerations.h"

@interface AccountViewController (){
    AccountOperations *accountOperationsObj;
    NSUserDefaults *defaults;
    NSDictionary *userData;
}

@end

@implementation AccountViewController

@synthesize firstName,lastName,email,phone,country,state,city,postalCode,address,goToLoginButtonOutlet;

@synthesize firstNameOutlet,lastNameOutlet,emailOutlet,phoneOutlet,countryOutlet,stateOutlet,cityOutlet,postalCodeOutlet,addressOutlet,userHistoryOutlet,userLogOutOutlet,editUserAccountOutlet;
@synthesize loggedOutAlert;

- (void)viewDidLoad {
    [super viewDidLoad];
    accountOperationsObj = [[AccountOperations alloc]init];
    defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
        
        firstName.text=@"";
        lastName.text=@"";
        email.text=@"";
        phone.text=@"";
        country.text=@"";
        state.text=@"";
        city.text=@"";
        postalCode.text=@"";
        address.text=@"";
        firstName.hidden=YES;
        lastName.hidden=YES;
        email.hidden=YES;
        phone.hidden=YES;
        country.hidden=YES;
        state.hidden=YES;
        city.hidden=YES;
        postalCode.hidden=YES;
        address.hidden=YES;
        firstNameOutlet.hidden=YES;
        lastNameOutlet.hidden=YES;
        emailOutlet.hidden=YES;
        phoneOutlet.hidden=YES;
        countryOutlet.hidden=YES;
        stateOutlet.hidden=YES;
        cityOutlet.hidden=YES;
        postalCodeOutlet.hidden=YES;
        addressOutlet.hidden=YES;
        goToLoginButtonOutlet.hidden=NO;
        userHistoryOutlet.enabled=NO;
        userHistoryOutlet.tintColor=[UIColor clearColor];
        userLogOutOutlet.enabled=NO;
        userLogOutOutlet.tintColor=[UIColor clearColor];
//        editUserAccountOutlet.enabled=NO;
//        editUserAccountOutlet.tintColor=[UIColor clearColor];
    }else{
        firstName.hidden=NO;
        lastName.hidden=NO;
        email.hidden=NO;
        phone.hidden=NO;
        country.hidden=NO;
        state.hidden=NO;
        city.hidden=NO;
        postalCode.hidden=NO;
        address.hidden=NO;
        firstNameOutlet.hidden=NO;
        lastNameOutlet.hidden=NO;
        emailOutlet.hidden=NO;
        phoneOutlet.hidden=NO;
        countryOutlet.hidden=NO;
        stateOutlet.hidden=NO;
        cityOutlet.hidden=NO;
        postalCodeOutlet.hidden=NO;
        addressOutlet.hidden=NO;
        goToLoginButtonOutlet.hidden=YES;
        userHistoryOutlet.enabled=YES;
        userHistoryOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
        userLogOutOutlet.enabled=YES;
        userLogOutOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
//        editUserAccountOutlet.enabled=YES;
//        editUserAccountOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
        
        userData = [defaults dictionaryForKey:@"LoggedInUsersDetail"];
        
        firstName.text=[userData valueForKey:@"firstName"];
        lastName.text=[userData valueForKey:@"lastName"];
        email.text=[userData valueForKey:@"usersEmail"];
        phone.text=[userData valueForKey:@"phone"];
        country.text=[userData valueForKey:@"country"];
        state.text=[userData valueForKey:@"state"];
        city.text=[userData valueForKey:@"city"];
        postalCode.text=[userData valueForKey:@"postalCode"];
        address.text=[userData valueForKey:@"address"];
    }
    
    loggedOutAlert = [UIAlertController
                             alertControllerWithTitle:@"Log Out?"
                             message:@"Are you sure?"
                             preferredStyle:UIAlertControllerStyleAlert];
    
    // Do any additional setup after loading the view.
    UIAlertAction* noButton = [UIAlertAction
                                actionWithTitle:@"Yes, Log Out!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [self->defaults setBool:NO forKey:@"SeesionUserLoggedIN"];
                                    [self->defaults setObject:@"" forKey:@"SessionLoggedInuserEmail"];
                                    [self->defaults setObject:@"" forKey:@"LoggedInUsersDetail"];
                                    [defaults synchronize];
                                }];
    UIAlertAction* yesButton = [UIAlertAction
                               actionWithTitle:@"Log Back In!"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   
                               }];
    
    [loggedOutAlert addAction:yesButton];
    [loggedOutAlert addAction:noButton];
}
- (void)viewDidAppear:(BOOL)animated{
    [self.view reloadInputViews];
    if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
        firstName.text=@"";
        lastName.text=@"";
        email.text=@"";
        phone.text=@"";
        country.text=@"";
        state.text=@"";
        city.text=@"";
        postalCode.text=@"";
        address.text=@"";
        firstName.hidden=YES;
        lastName.hidden=YES;
        email.hidden=YES;
        phone.hidden=YES;
        country.hidden=YES;
        state.hidden=YES;
        city.hidden=YES;
        postalCode.hidden=YES;
        address.hidden=YES;
        firstNameOutlet.hidden=YES;
        lastNameOutlet.hidden=YES;
        emailOutlet.hidden=YES;
        phoneOutlet.hidden=YES;
        countryOutlet.hidden=YES;
        stateOutlet.hidden=YES;
        cityOutlet.hidden=YES;
        postalCodeOutlet.hidden=YES;
        addressOutlet.hidden=YES;
        goToLoginButtonOutlet.hidden=NO;
        userHistoryOutlet.enabled=NO;
        userHistoryOutlet.tintColor=[UIColor clearColor];
        userLogOutOutlet.enabled=NO;
        userLogOutOutlet.tintColor=[UIColor clearColor];
//        editUserAccountOutlet.enabled=NO;
//        editUserAccountOutlet.tintColor=[UIColor clearColor];
    }else{
        firstName.hidden=NO;
        lastName.hidden=NO;
        email.hidden=NO;
        phone.hidden=NO;
        country.hidden=NO;
        state.hidden=NO;
        city.hidden=NO;
        postalCode.hidden=NO;
        address.hidden=NO;
        firstNameOutlet.hidden=NO;
        lastNameOutlet.hidden=NO;
        emailOutlet.hidden=NO;
        phoneOutlet.hidden=NO;
        countryOutlet.hidden=NO;
        stateOutlet.hidden=NO;
        cityOutlet.hidden=NO;
        postalCodeOutlet.hidden=NO;
        addressOutlet.hidden=NO;
        goToLoginButtonOutlet.hidden=YES;
        userHistoryOutlet.enabled=NO;
        userHistoryOutlet.tintColor=[UIColor clearColor];
        userLogOutOutlet.enabled=YES;
        userLogOutOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
//        editUserAccountOutlet.enabled=YES;
//        editUserAccountOutlet.tintColor=[UIColor colorNamed:@"Cornflower Blue"];
        
        userData = [defaults dictionaryForKey:@"LoggedInUsersDetail"];
        
        firstName.text=[userData valueForKey:@"firstName"];
        lastName.text=[userData valueForKey:@"lastName"];
        email.text=[userData valueForKey:@"usersEmail"];
        phone.text=[userData valueForKey:@"phone"];
        country.text=[userData valueForKey:@"country"];
        state.text=[userData valueForKey:@"state"];
        city.text=[userData valueForKey:@"city"];
        postalCode.text=[userData valueForKey:@"postalCode"];
        address.text=[userData valueForKey:@"address"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)theEditButtonForLoginOrEdit:(id)sender {
    if (![defaults boolForKey:@"SeesionUserLoggedIN"]) {
        [self performSegueWithIdentifier:@"loginAccountSegue" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"editAccountSegue" sender:nil];
    }
}

- (IBAction)goToLoginButton:(id)sender {
    [self performSegueWithIdentifier:@"loginAccountSegue" sender:nil];
}

- (IBAction)userLogoutButton:(id)sender {
    [self presentViewController:loggedOutAlert animated:YES completion:nil];
}
@end
