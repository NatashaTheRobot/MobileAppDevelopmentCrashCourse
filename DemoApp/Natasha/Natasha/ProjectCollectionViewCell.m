//
//  ProjectCollectionViewCell.m
//  Natasha
//
//  Created by Natasha Murashev on 11/24/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "ProjectCollectionViewCell.h"

@interface ProjectCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ProjectCollectionViewCell

- (void)setProject:(Project *)project
{
    _project = project;
    
    self.imageView.image = project.smallImage;
    self.label.text = project.title;
}

@end
