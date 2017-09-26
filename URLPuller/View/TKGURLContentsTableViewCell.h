//
//  TKGURLContentsTableViewCell.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKGURLContentsTableViewCell : UITableViewCell

- (void) updateCellWithURLContents:(TKGURLContents *)urlContents forIndexNumber:(NSInteger)indexNumber withLocalStorageSize:(NSInteger)localStorageSize;

@end
