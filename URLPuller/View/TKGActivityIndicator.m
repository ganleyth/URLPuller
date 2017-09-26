//
//  TKGActivityIndicator.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGActivityIndicator.h"

@interface TKGActivityIndicator ()

@property (nonatomic) UIActivityIndicatorView *activityIndicator;

@end

@implementation TKGActivityIndicator

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _activityIndicator = [[UIActivityIndicatorView alloc] init];
    }
    
    [self setupViewAndActivityIndicator];
    return self;
}

- (void) setupViewAndActivityIndicator
{
    self.frame = CGRectMake(0.0, 0.0, 60.0, 60.0);
    self.backgroundColor = [UIColor lightGrayColor];
    self.layer.cornerRadius = 16.0;
    
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    self.activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.activityIndicator];
    
    [[self.activityIndicator.widthAnchor constraintEqualToConstant:40.0] setActive:YES];
    [[self.activityIndicator.heightAnchor constraintEqualToConstant:40.0] setActive: YES];
    [[self.activityIndicator.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:YES];
    [[self.activityIndicator.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
}

- (void) startActivityIndicator
{
    [self.activityIndicator startAnimating];
}

- (void) stopActivityIndicator
{
    [self.activityIndicator stopAnimating];
}

@end
