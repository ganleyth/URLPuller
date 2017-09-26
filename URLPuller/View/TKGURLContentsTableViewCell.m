//
//  TKGURLContentsTableViewCell.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContentsTableViewCell.h"
#import "TKGURLContents.h"

@interface TKGURLContentsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *endPointLabel;
@property (weak, nonatomic) IBOutlet UILabel *localStorageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation TKGURLContentsTableViewCell

- (void) updateCellWithURLContents:(TKGURLContents *)urlContents forIndexNumber:(NSInteger)indexNumber withLocalStorageSize:(NSInteger)localStorageSize
{
    self.nameLabel.text = [NSString stringWithFormat:@"URL #%@", @(indexNumber)];
    self.endPointLabel.text = urlContents.endPointURL.absoluteString;
    self.localStorageLabel.text = urlContents.localStorageURL.absoluteString;
    self.sizeLabel.text = [NSString stringWithFormat:@"%@ bytes", @(localStorageSize)];
}

@end
