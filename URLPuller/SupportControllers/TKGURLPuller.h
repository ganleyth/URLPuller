//
//  TKGURLPuller.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKGURLPuller : NSObject

- (void) downloadURLsAsync: (NSArray *)urls;
- (void) waitUntilAllDownloadsFinish;
- (NSString *) downloadedPathForURL:(NSURL *)url;

@end
