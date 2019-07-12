//
//  AccountOperations.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 13/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountOperations : NSObject

+(AccountOperations *) sharedInstance; // the purpose is to load all users data is cache

- ( NSURLSession * )getURLSession;
- (NSString *)sha1:(NSString *)str ;

-(void)sendRequestToServer:(NSDictionary *)dataToSend callback:(void (^)(NSError *error, BOOL success, NSString* customErrorMessage))callback;

- (BOOL)validateEmailAccount:(NSString*)checkString;

@end

NS_ASSUME_NONNULL_END
