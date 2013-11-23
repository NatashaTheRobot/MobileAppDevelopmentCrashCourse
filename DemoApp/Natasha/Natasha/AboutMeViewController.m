//
//  AboutMeViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/17/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "AboutMeViewController.h"

@interface AboutMeViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;

@end

@implementation AboutMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height + self.view.frame.size.height / 4;
    self.scrollView.contentSize = CGSizeMake(width, height);
    
    self.imageContainerView.layer.borderWidth = 1.0;
    
    
    self.imageContainerView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
}

@end
