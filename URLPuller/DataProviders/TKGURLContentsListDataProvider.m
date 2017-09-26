//
//  TKGURLContentsListDataProvider.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContentsListDataProvider.h"
#import "TKGURLContentsController.h"
#import "TKGURLContentsTableViewCell.h"

@implementation TKGURLContentsListDataProvider

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[TKGURLContentsController sharedInstance] urlContentsObjects].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGURLContentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"urlContentsCell" forIndexPath:indexPath];
    
    return cell;
}

@end
