//
//  ThankYouViewController.m
//  E-Commerce App Project (Tabbed)
//
//  Created by Rony Banik on 18/11/18.
//  Copyright © 2018 Rony Banik. All rights reserved.
//

#import "ThankYouViewController.h"

@interface ThankYouViewController ()

@end

@implementation ThankYouViewController
@synthesize wkwebviewOutletForPDFShow,uiviewForArko,emailThankYouPage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *PDFFilePath = [defaults valueForKey:@"pdfFilePath"];
    emailThankYouPage.text = [defaults valueForKey:@"SessionLoggedInuserEmail"];
    
    NSURL *pdfUrl = [[NSURL alloc]initFileURLWithPath:PDFFilePath];
    
    [wkwebviewOutletForPDFShow loadFileURL:pdfUrl allowingReadAccessToURL:pdfUrl];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
