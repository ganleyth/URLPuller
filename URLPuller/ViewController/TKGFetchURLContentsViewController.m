//
//  TKGFetchURLContentsViewController.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGFetchURLContentsViewController.h"
#import "TKGActivityIndicator.h"
#import "TKGURLPuller.h"
#import "TKGMockData.h"

@interface TKGFetchURLContentsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *fetchURLContentsButton;
@property (weak, nonatomic) IBOutlet UIButton *viewResultsButton;

@property (nonatomic) TKGActivityIndicator *activityIndicatorView;

@end

@implementation TKGFetchURLContentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupActivityIndicator];
    [self initializeViews];
}

#pragma mark - Action methods
- (IBAction)fetchURLContentsButtonTapped:(UIButton *)sender
{
    self.activityIndicatorView.alpha = 1.0;
    
    TKGURLPuller *urlPuller = [[TKGURLPuller alloc] init];
    NSArray *mockDataArray = [TKGMockData mockURLs];
    
    [self.activityIndicatorView startActivityIndicator];
    [urlPuller downloadURLsAsync:mockDataArray];
    [urlPuller waitUntilAllDownloadsFinish];
    [self.activityIndicatorView stopActivityIndicator];
    
    self.activityIndicatorView.alpha = 0.0;
    [self enableResultsButton];
}

#pragma mark - Helper methods
- (void) setupActivityIndicator
{
    self.activityIndicatorView = [[TKGActivityIndicator alloc] init];
    
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.activityIndicatorView];
    [self.view bringSubviewToFront:self.activityIndicatorView];
    
    [[self.activityIndicatorView.widthAnchor constraintEqualToConstant:60.0] setActive:YES];
    [[self.activityIndicatorView.heightAnchor constraintEqualToConstant:60.0] setActive:YES];
    [[self.activityIndicatorView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.activityIndicatorView.bottomAnchor constraintEqualToAnchor:self.fetchURLContentsButton.topAnchor constant:-60.0] setActive:YES];
    
    self.activityIndicatorView.alpha = 0.0;
}

- (void) initializeViews
{
    self.fetchURLContentsButton.layer.cornerRadius = 16.0;
    self.viewResultsButton.layer.cornerRadius = 16.0;
    [self disableResultsButton];
}

- (void) enableResultsButton
{
    self.viewResultsButton.alpha = 1.0;
    [self.viewResultsButton setEnabled:YES];
}

- (void) disableResultsButton
{
    self.viewResultsButton.alpha = 0.25;
    [self.viewResultsButton setEnabled:NO];
}

@end
