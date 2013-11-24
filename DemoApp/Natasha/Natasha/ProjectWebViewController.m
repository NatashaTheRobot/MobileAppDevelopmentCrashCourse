//
//  ProjectWebViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/24/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "ProjectWebViewController.h"

@interface ProjectWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ProjectWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.projectURL];
    [self.webView loadRequest:urlRequest];
}

@end
