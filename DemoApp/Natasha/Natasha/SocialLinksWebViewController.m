//
//  SocialLinksWebViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/20/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "SocialLinksWebViewController.h"

@interface SocialLinksWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation SocialLinksWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = self.serviceName;
    
    NSURL *url = [NSURL URLWithString:self.socialURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
