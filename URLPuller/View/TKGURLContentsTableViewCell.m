//
//  TKGURLContentsTableViewCell.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContentsTableViewCell.h"
#import "TKGURLContents.h"
#import "TKGURLPuller.h"

@interface TKGURLContentsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *endPointLabel;
@property (weak, nonatomic) IBOutlet UILabel *localStorageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (nonatomic) TKGURLPuller *urlPuller;

@end

@implementation TKGURLContentsTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.urlPuller = [[TKGURLPuller alloc] init];
}

- (void) updateCellWithURLContents:(TKGURLContents *)urlContents forIndexNumber:(NSInteger)indexNumber withLocalStorageSize:(NSInteger)localStorageSize
{
    self.nameLabel.text = [NSString stringWithFormat:@"URL #%@", @(indexNumber)];
    self.endPointLabel.text = urlContents.endPointURL.absoluteString;
    self.localStorageLabel.text = [self.urlPuller downloadedPathForURL:urlContents.endPointURL];
    self.sizeLabel.text = [NSString stringWithFormat:@"%@ bytes", @(localStorageSize)];
}

@end
