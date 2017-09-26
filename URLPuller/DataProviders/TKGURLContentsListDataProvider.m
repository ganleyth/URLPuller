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
#import "TKGURLContents.h"
#import "TKGFileSystemController.h"

@implementation TKGURLContentsListDataProvider

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = [[TKGURLContentsController sharedInstance] urlContentsObjects].count;
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGURLContentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"urlContentsCell" forIndexPath:indexPath];
    TKGURLContents *urlContents = [[TKGURLContentsController sharedInstance] urlContentsObjects][indexPath.row];
    NSInteger localDataLength = [TKGFileSystemController lengthForDataAtLocalStorageURL:urlContents.localStorageURL];
    
    [cell updateCellWithURLContents:urlContents forIndexNumber:indexPath.row withLocalStorageSize:localDataLength];
    return cell;
}

@end
