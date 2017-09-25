//
//  TKGURLPuller.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLPuller.h"
#import "TKGNetworkClient.h"
#import "TKGURLContents.h"
#import "TKGURLContentsController.h"
#import "TKGFileSystemController.h"

@interface TKGURLPuller ()

@property (nonatomic) NSObject *dispatchGroup;

@end

@implementation TKGURLPuller

- (void) downloadURLsAsync: (NSArray *)urls
{
    self.dispatchGroup = dispatch_group_create();
    
    for (int i = 0; i < urls.count; i++) {
        NSURL *url = urls[i];
        [TKGNetworkClient performDataTaskForURL:url withCompletion:^(NSData *data, NSError *error) {
            if (error) {
                NSLog(@"Error encountered fetching URL contents: %@", error.localizedDescription);
                return;
            }
            
            TKGURLContents *urlContents = [[TKGURLContentsController sharedInstance] addURLContentsObjectWithEndPointURL:url];
            [[TKGURLContentsController sharedInstance] updateURLContents:urlContents withData:data];
            
            NSURL *localStorageURL = [TKGFileSystemController urlAfterSavingData:data forEndPointURL:url];
            [[TKGURLContentsController sharedInstance] updateURLContents:urlContents withLocalStorageURL:localStorageURL];
        }];
    }
}

- (void) waitUntilAllDownloadsFinish
{
    
}

- (NSString *) downloadedPathForURL:(NSURL *)url
{
    return @"";
}

@end
