//
//  SocailLinksTableViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/19/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "SocialLinksTableViewController.h"
#import "SocialLinksWebViewController.h"

@interface SocialLinksTableViewController ()

@property (strong, nonatomic) NSArray *socialServices;
@property (strong, nonatomic) NSArray *socialUsernames;
@property (strong, nonatomic) NSArray *socialURLs;

@end

@implementation SocialLinksTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.socialServices = @[@"Blog", @"LinkedIn", @"Facebook", @"Twitter", @"Github"];
    self.socialUsernames = @[@"natashatherobot.com", @"in/natashatherobot", @"natasha.murashev", @"@NatashaTheRobot", @"NatashaTheRobot"];
    self.socialURLs = @[@"http://natashatherobot.com/",
                        @"http://www.linkedin.com/in/natashatherobot",
                        @"https://www.facebook.com/natasha.murashev",
                        @"https://twitter.com/NatashaTheRobot",
                        @"https://github.com/natashatherobot"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SocialLinksWebViewController *socialLinksWebViewController = segue.destinationViewController;
    NSIndexPath *indexPathForSelectedCell = [self.tableView indexPathForSelectedRow];
    NSString *socialURL = [self.socialURLs objectAtIndex:indexPathForSelectedCell.row];
    socialLinksWebViewController.socialURL = socialURL;
    socialLinksWebViewController.serviceName = self.socialServices[indexPathForSelectedCell.row];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.socialServices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"socialLinksCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *socialService = [self.socialServices objectAtIndex:indexPath.row];
    cell.textLabel.text = socialService;
    cell.imageView.image = [UIImage imageNamed:socialService];
    cell.detailTextLabel.text = self.socialUsernames[indexPath.row];
    
    return cell;
}

@end
