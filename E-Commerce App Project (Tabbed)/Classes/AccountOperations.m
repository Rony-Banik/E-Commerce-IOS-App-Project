//
//  AccountOperations.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 13/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "AccountOperations.h"
#import <CommonCrypto/CommonCrypto.h>


@interface AccountOperations()

@property (strong, nonatomic) NSMutableArray* itemArray;

@end

@implementation AccountOperations


+ (AccountOperations *)sharedInstance
{
    static AccountOperations*  _sharedAccountOperations;
    
    static dispatch_once_t once;
    dispatch_once(&once,^{
        _sharedAccountOperations = [[AccountOperations alloc] init];
    });
    
    return _sharedAccountOperations;
}

- (NSString *)sha1:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, strlen(cStr), result);
    NSString *s = [NSString  stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   result[0], result[1], result[2], result[3], result[4],
                   result[5], result[6], result[7],
                   result[8], result[9], result[10], result[11], result[12],
                   result[13], result[14], result[15],
                   result[16], result[17], result[18], result[19]
                   ];
    
    return s;
}
- ( NSURLSession * )getURLSession
{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken,
                  ^{
                      NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                      session = [NSURLSession sessionWithConfiguration:configuration];
                  } );
    return session;
}

-(void)sendRequestToServer:(NSDictionary *)dataToSend callback:(void (^)(NSError *error, BOOL success, NSString* customErrorMessage))callback{
    
    NSError* jsonSerializationError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataToSend options:0 error:&jsonSerializationError];
    if (!jsonData) {
        //NSLog(@"Got jsonSerailError: %@",jsonSerializationError);
    }else{
        NSString *jsonString;
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        NSData* requestData = [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
        
        [request setURL:[NSURL URLWithString:@"https://apiforios.appendtech.com/urltosendrequestwithdata.php?InitialSecureKey:ououhkju59703373367639792F423F4528482B4D6251655468576D5A7134743777217A25iuiu"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"theHeaderString" forHTTPHeaderField:@"AmrLagto"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:requestData];
        NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^( NSData *data, NSURLResponse *response, NSError *error )
                  {
                      dispatch_async( dispatch_get_main_queue(),
                            ^{
                                // parse returned data
                                NSString *customErrorMessage;
                                if (error) {
                                    customErrorMessage = @"Something Went Wrong! Please try again after Sometime";
                                    callback(error, YES, customErrorMessage);
                                }
                                else {
                                    // for Quick Testing
//                                    NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//                                    NSLog(@"result of strign %@",result);
                                    
                                    NSData* jsonData = [NSData dataWithData:data];
                                    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                    NSDictionary *responseDictionary = [[NSDictionary alloc]initWithDictionary:(NSDictionary*)jsonArray];
                                    
                                    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
                                    if (([httpResponse statusCode] == 200)&& ([[responseDictionary valueForKey:@"RequestExecuted"] isEqualToString:@"TRUE"])) {
                                        NSLog(@"Response Back korse");
                                        if ([[responseDictionary valueForKey:@"actionRequest"] isEqualToString:@"REGISTER_USER"]) {
                                            if ([[responseDictionary valueForKey:@"NullFieldsFound"] isEqualToString:@"TRUE"]) {
                                                //form empty
                                                customErrorMessage = @"Every Form Field is required for Successful purchase";
                                                callback(error, YES, customErrorMessage);
                                                
                                            }else if ([[responseDictionary valueForKey:@"userRegistrationPassMisMatch"] isEqualToString:@"YES"]){
                                                //confirm Password and pass mismatch
                                                customErrorMessage = @"Password and Confirm Password must be same!";
                                                callback(error, YES, customErrorMessage);
                                            }else if([[responseDictionary valueForKey:@"userAlreadyRegistered"] isEqualToString:@"YES"]){
                                                //email already registered
                                                customErrorMessage = @"This email is already registered";
                                                callback(error, YES, customErrorMessage);
                                            }else{
                                                // user registered
                                                customErrorMessage = @"Registraition Successful";
                                                callback(error, YES, customErrorMessage);
                                            }
                                        }else if ([[responseDictionary valueForKey:@"actionRequest"] isEqualToString:@"CHECK_USER_LOGIN"]){
                                            if ([[responseDictionary valueForKey:@"userExist"] isEqualToString:@"TRUE"]) {
                                                [defaults setBool:YES forKey:@"SeesionUserLoggedIN"];
                                                [defaults setObject:[responseDictionary valueForKey:@"usersEmail"] forKey:@"SessionLoggedInuserEmail"];
                                                [defaults setObject:responseDictionary forKey:@"LoggedInUsersDetail"];
                                                [defaults synchronize];
                                                customErrorMessage = @"Login Successful";
                                                callback(error, YES, customErrorMessage);
                                            }else if ([[responseDictionary valueForKey:@"passwordMismatch"] isEqualToString:@"YES"]) {
                                                [defaults setBool:NO forKey:@"SeesionUserLoggedIN"];
                                                [defaults setObject:[responseDictionary valueForKey:@""] forKey:@"SessionLoggedInuserEmail"];
                                                [defaults synchronize];
                                                customErrorMessage = @"Wrong Password!";
                                                callback(error, YES, customErrorMessage);
                                                
                                            }else{
                                                // login failed
                                                [defaults setBool:NO forKey:@"SeesionUserLoggedIN"];
                                                [defaults setObject:[responseDictionary valueForKey:@""] forKey:@"SessionLoggedInuserEmail"];
                                                [defaults synchronize];
                                                customErrorMessage = @"User Does Not Exist!";
                                                callback(error, YES, customErrorMessage);
                                            }
                                        }else if([[responseDictionary valueForKey:@"actionRequest"] isEqualToString:@"EDIT_USER"]){
                                            if ([[responseDictionary valueForKey:@"NullFieldsFound"] isEqualToString:@"TRUE"]) {
                                                //form empty
                                                customErrorMessage = @"Every Field is Required!";
                                                callback(error, YES, customErrorMessage);
                                            }else if ([[responseDictionary valueForKey:@"userUpdatePassMisMatch"] isEqualToString:@"YES"]){
                                                //confirm Password and pass mismatch
                                                customErrorMessage = @"Password and Confirm Password must be same!";
                                                callback(error, YES, customErrorMessage);
                                            }else{
                                                // user updated
                                                customErrorMessage = @"Update Successful";
                                                callback(error, YES, customErrorMessage);
                                            }
                                        }else{
                                            //Nothing Happened
                                            customErrorMessage = @"Check Your Request!";
                                            callback(error, YES, customErrorMessage);
                                        }
                                        
                                }else{
                                    //request not executed but reached the server
                                    NSString *anotherCustomErrorMessage = @"Server Busy! Please Come Back After Some Time";
                                            callback(error, NO, anotherCustomErrorMessage);
                                    }
                                }
                            } );
                  }];
        [task resume];
    }
    
}
- (BOOL)validateEmailAccount:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
@end
