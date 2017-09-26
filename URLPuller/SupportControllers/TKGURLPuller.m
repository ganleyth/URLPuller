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

@property (nonatomic) NSObject<OS_dispatch_group> *dispatchGroup;

@end

@implementation TKGURLPuller

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _dispatchGroup = dispatch_group_create();
    }
    
    return self;
}

- (void) downloadURLsAsync: (NSArray *)urls
{
    self.dispatchGroup = dispatch_group_create();
    
    for (int i = 0; i < urls.count; i++) {
        NSURL *url = urls[i];
        
        dispatch_group_enter(self.dispatchGroup);
        [TKGNetworkClient performDataTaskForURL:url withCompletion:^(NSData *data, NSError *error) {
            if (error)
            {
                NSLog(@"Error encountered fetching URL contents: %@", error.localizedDescription);
                return;
            }
            
            TKGURLContents *urlContents = [[TKGURLContentsController sharedInstance] addURLContentsObjectWithEndPointURL:url];
            [[TKGURLContentsController sharedInstance] updateURLContents:urlContents withData:data];
            
            NSURL *localStorageURL = [TKGFileSystemController urlAfterSavingData:data forEndPointURL:url];
            [[TKGURLContentsController sharedInstance] updateURLContents:urlContents withLocalStorageURL:localStorageURL];
            
            dispatch_group_leave(self.dispatchGroup);
        }];
    }
}

- (void) waitUntilAllDownloadsFinish
{
    dispatch_group_wait(self.dispatchGroup, DISPATCH_TIME_FOREVER);
}

- (NSString *) downloadedPathForURL:(NSURL *)url
{
    NSURL *downloadedPathURL = [[TKGURLContentsController sharedInstance] localPathURLForEndPointURL:url];
    return downloadedPathURL.absoluteString;
}

@end
