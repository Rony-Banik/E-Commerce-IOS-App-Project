//
//  Validation.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 15/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJWValidator.h"

NS_ASSUME_NONNULL_BEGIN

@interface Validation : NSObject
- (AJWValidator *)minLengthValidator:(NSString *)errorMessage withLabelForValidationRules:(UILabel *)validationStatusLabel;

- (AJWValidator *)requiredMinLengthValidator:(NSString *)requiredErrorMessage
                         IntegerforMinLength:(NSUInteger *)minLength
                       minLengthErrorMessage:(NSString *)minLengthErrorMessage
                 withLabelForValidationRules:(UILabel *)validationStatusLabel;

- (AJWValidator *)phoneValidator:(UILabel *)validationStatusLabel;
- (AJWValidator *)emailValidator:(UILabel *)validationStatusLabel;
- (AJWValidator *)equalityValidator:(id)password with:(UILabel *)validationStatusLabel;
- (AJWValidator *)requiredValidator:(NSString *)errorMessage withLabelForValidationRules:(UILabel *)validationStatusLabel;
@end

NS_ASSUME_NONNULL_END
