//
//  Project.h
//  Natasha
//
//  Created by Natasha Murashev on 11/24/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (strong, nonatomic) NSString  *title;
@property (strong, nonatomic) UIImage   *smallImage;
@property (strong, nonatomic) UIImage   *largeImage;
@property (strong, nonatomic) NSURL     *url;
@property (strong, nonatomic) NSString  *description;

@end
