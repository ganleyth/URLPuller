//
//  TKGURLContentsListViewController.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContentsListViewController.h"
#import "TKGURLContentsListDataProvider.h"

@interface TKGURLContentsListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) TKGURLContentsListDataProvider *dataProvider;

@end

@implementation TKGURLContentsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataProvider = [[TKGURLContentsListDataProvider alloc] init];
    
    self.tableView.delegate = self.dataProvider;
    self.tableView.dataSource = self.dataProvider;
    
    [self setupViews];
}

- (void) setupViews
{
    self.tableView.estimatedRowHeight = 140.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView reloadData];
}

@end
