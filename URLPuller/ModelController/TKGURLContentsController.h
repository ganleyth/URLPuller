//
//  TKGURLContentsController.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TKGURLContents;

@interface TKGURLContentsController : NSObject

+ (TKGURLContentsController *)sharedInstance;

- (TKGURLContents *) addURLContentsObjectWithEndPointURL:(NSURL *)endPointURL;
- (void) updateURLContents:(TKGURLContents *)urlContents withData:(NSData *)data;
- (void) updateURLContents:(TKGURLContents *)urlContents withLocalStorageURL:(NSURL *)localStorageURL;
- (NSArray *) urlContentsObjects;

@end
