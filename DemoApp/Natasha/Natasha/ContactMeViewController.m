//
//  ContactMeViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/21/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "ContactMeViewController.h"
#import "sendgrid.h"

@interface ContactMeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@end

@implementation ContactMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - Actions

- (IBAction)onClearButtonTap:(id)sender
{
    self.nameTextField.text = nil;
    self.emailTextField.text = nil;
    self.messageTextView.text = @"Hi Natasha, ";
    
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.messageTextView resignFirstResponder];
}

- (IBAction)onSendButtonTap:(id)sender
{
    sendgrid *msg = [sendgrid user:@"YOUREMAIL@gmail.com" andPass:@"YOURPASSWORD"];
    msg.to = @"natasha@natashatherobot.com";
    msg.from = self.emailTextField.text;
    msg.subject = [NSString stringWithFormat:@"Message from %@", self.nameTextField.text];
    msg.text = self.messageTextView.text;
    msg.html = self.messageTextView.text;
    
    [msg sendWithWebUsingSuccessBlock:^(id responseObject) {
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    ContactMeViewController *weakSelf = self;
    [msg sendWithWebUsingSuccessBlock:^(id responseObject) {
        [weakSelf onClearButtonTap:weakSelf];
        UIAlertView *messageSentAlertView = [[UIAlertView alloc] initWithTitle:@"Yay!"
                                                                       message:@"Glad to hear from you. I'll reply back as soon as I can."
                                                                      delegate:self
                                                             cancelButtonTitle:@"Ok"
                                                             otherButtonTitles:nil];
        [messageSentAlertView show];
    } failureBlock:^(NSError *error) {
        
        UIAlertView *messageSentAlertView = [[UIAlertView alloc] initWithTitle:@"Whoops!"
                                                                       message:@"Something went wrong. Please try again!"
                                                                      delegate:self
                                                             cancelButtonTitle:@"Ok"
                                                             otherButtonTitles:nil];
        [messageSentAlertView show];
    }];

}

@end
