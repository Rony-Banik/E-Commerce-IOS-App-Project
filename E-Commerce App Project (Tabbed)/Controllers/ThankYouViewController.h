//
//  ThankYouViewController.h
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 18/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ThankYouViewController : UIViewController<WKUIDelegate>
@property (strong, nonatomic) IBOutlet WKWebView *wkwebviewOutletForPDFShow;
@property (strong, nonatomic) IBOutlet UIView *uiviewForArko;
@property (strong, nonatomic) IBOutlet UILabel *emailThankYouPage;
@end

NS_ASSUME_NONNULL_END
