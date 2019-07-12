//
//  Validation.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 15/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "Validation.h"

@implementation Validation

- (AJWValidator *)requiredMinLengthValidator:(NSString *)requiredErrorMessage
              IntegerforMinLength:(NSUInteger *)minLength
              minLengthErrorMessage:(NSString *)minLengthErrorMessage
              withLabelForValidationRules:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsurePresenceWithInvalidMessage:NSLocalizedString(requiredErrorMessage, nil)];
    [validator addValidationToEnsureMinimumLength:minLength invalidMessage:NSLocalizedString(minLengthErrorMessage, nil)];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}
- (AJWValidator *)equalityValidator:(id)password with:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureInstanceIsTheSameAs:password invalidMessage:NSLocalizedString(@"Should be equal to 'password'", nil)];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}
- (AJWValidator *)customValidator
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureCustomConditionIsSatisfiedWithBlock:^BOOL(NSString *instance) {
        return ([instance rangeOfString:@"A"].location == NSNotFound);
    } invalidMessage:NSLocalizedString(@"No capital As are allowed!", nil)];
    return validator;
}
- (AJWValidator *)emailValidator:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureValidEmailWithInvalidMessage:@"Must be a valid email address!"];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}
- (AJWValidator *)phoneValidator:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRegularExpressionIsMetWithPattern:@"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$" invalidMessage:NSLocalizedString(@"Please check your phone no again!", nil)];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}

- (AJWValidator *)regexValidator
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRegularExpressionIsMetWithPattern:@"hello" invalidMessage:NSLocalizedString(@"You have to say hello!", nil)];
    return validator;
}
- (AJWValidator *)requiredValidator:(NSString *)errorMessage withLabelForValidationRules:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsurePresenceWithInvalidMessage:NSLocalizedString(errorMessage, nil)];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}
- (AJWValidator *)maxLengthValidator
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureMaximumLength:8 invalidMessage:NSLocalizedString(@"Max length is 8 characters!", nil)];
    return validator;
}
- (AJWValidator *)minLengthValidator:(NSString *)errorMessage withLabelForValidationRules:(UILabel *)validationStatusLabel
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureMinimumLength:6 invalidMessage:NSLocalizedString(errorMessage, nil)];
    validator.validatorStateChangedHandler = ^(AJWValidatorState newState) {
        switch (newState) {
                
            case AJWValidatorValidationStateValid:
                // do happy things
                [self handleValid:validationStatusLabel];
                NSLog(@"validator valid :%@",validator);
                break;
                
            case AJWValidatorValidationStateInvalid:
                // do unhappy things
                [self handleInvalid:validator withLabelForError:validationStatusLabel];
                NSLog(@"validator invalid:%@",validator);
                break;
                
            case AJWValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                [self handleWaiting];
                NSLog(@"validator waiting:%@",validator);
                break;
                
        }
    };
    return validator;
}

- (AJWValidator *)rangeValidator
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureRangeWithMinimum:@3 maximum:@8 invalidMessage:NSLocalizedString(@"Should be between 3 and 8 characters", nil)];
    return validator;
}
- (AJWValidator *)stringContainsNumberValidator
{
    AJWValidator *validator = [AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureStringContainsNumberWithInvalidMessage:NSLocalizedString(@"Please add a digit to your entry", nil)];
    return validator;
}
- (void)handleValid:(UILabel *)validationStatusLabel 
{
    validationStatusLabel.hidden=NO;
    UIColor *validGreen = [UIColor colorWithRed:0.27 green:0.63 blue:0.27 alpha:1];
    validationStatusLabel.backgroundColor = [validGreen colorWithAlphaComponent:0.3];
    validationStatusLabel.text = NSLocalizedString(@"No errors 😃", nil);
    validationStatusLabel.textColor = validGreen;
    validationStatusLabel.hidden=YES;
}

- (void)handleInvalid:(AJWValidator *)validator withLabelForError:(UILabel *)validationStatusLabel
{
    validationStatusLabel.hidden=NO;
    UIColor *invalidRed = [UIColor colorWithRed:0.89 green:0.18 blue:0.16 alpha:1];
    validationStatusLabel.backgroundColor = [invalidRed colorWithAlphaComponent:0.3];
    validationStatusLabel.text = [validator.errorMessages componentsJoinedByString:@" 💣\n"];
    validationStatusLabel.textColor = invalidRed;
}

- (void)handleWaiting
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

@end
