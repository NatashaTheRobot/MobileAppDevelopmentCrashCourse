//
//  ProjectsCollectionViewController.m
//  Natasha
//
//  Created by Natasha Murashev on 11/24/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "ProjectsCollectionViewController.h"
#import "Project.h"
#import "ProjectCollectionViewCell.h"
#import "ProjectDetailsViewController.h"

@interface ProjectsCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *projects;

@end

@implementation ProjectsCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self setupProjects];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ProjectDetailsViewController *projectDetailsViewController = segue.destinationViewController;
    
    NSIndexPath *indexPathForSelectedCell = [self.collectionView indexPathsForSelectedItems][0];
    Project *selectedProject = self.projects[indexPathForSelectedCell.row];
    
    projectDetailsViewController.project = selectedProject;
}

#pragma mark - Collection View Data Source Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.projects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"projectCell";
    ProjectCollectionViewCell *projectCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Project *project = self.projects[indexPath.row];
    projectCell.project = project;
    
    return projectCell;
}

#pragma mark - Private Methods

- (void)setupProjects
{
    self.projects = [NSMutableArray arrayWithCapacity:3];
    
    Project *shopLater = [[Project alloc] init];
    shopLater.title = @"ShopLater";
    shopLater.url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/shoplater/id664768597?mt=8"];
    shopLater.smallImage = [UIImage imageNamed:@"shopLaterSmall"];
    shopLater.largeImage = [UIImage imageNamed:@"shopLaterLarge"];
    shopLater.description = @"ShopLater is an easy way to track prices on items you love but are too expensive at the moment.";
    
    [self.projects addObject:shopLater];
    
    Project *alphavit = [[Project alloc] init];
    alphavit.title = @"Alphavit";
    alphavit.url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/alphavit/id668011464?mt=8"];
    alphavit.smallImage = [UIImage imageNamed:@"alphavitSmall"];
    alphavit.largeImage = [UIImage imageNamed:@"alphavitLarge"];
    alphavit.description = @"From our family to yours, Alphavit makes it fun to learn the Russian Alphabet. Each letter was hand-drawn by my little sister, who also recorded each word with my mother's help.";
    
    [self.projects addObject:alphavit];
    
    Project *stayInShape = [[Project alloc] init];
    stayInShape.title = @"Stay In Shape";
    stayInShape.url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/stay-in-shape/id720512626?mt=8"];
    stayInShape.smallImage = [UIImage imageNamed:@"stayInShapeSmall"];
    stayInShape.largeImage = [UIImage imageNamed:@"stayInShapeLarge"];
    stayInShape.description = @"Stay in Shape is a cool new game for all ages (preferably 4 and above). Learning shapes and colors was never that fun and with Stay in Shape we are trying to take this learning approach to the whole new level.";
    
    [self.projects addObject:stayInShape];
    
}

@end
