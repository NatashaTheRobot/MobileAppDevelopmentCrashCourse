//
//  ProjectDetailsViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/24/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "ProjectWebViewController.h"

@interface ProjectDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ProjectDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.project.title;
    self.imageView.image = self.project.largeImage;
    self.textView.text = self.project.description;
    self.textView.font = [UIFont systemFontOfSize:18.0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ProjectWebViewController *projectWebViewController = segue.destinationViewController;
    projectWebViewController.projectURL = self.project.url;
}

@end
