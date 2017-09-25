//
//  TKGURLContentsController.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContentsController.h"
#import "TKGURLContents.h"

@interface TKGURLContentsController ()

@property (nonatomic) NSMutableArray *internalURLContentsObjects;

@end

@implementation TKGURLContentsController

+ (TKGURLContentsController *)sharedInstance
{
    static TKGURLContentsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TKGURLContentsController new];
    });
    return sharedInstance;
}

- (TKGURLContents *) addURLContentsObjectWithEndPointURL:(NSURL *)endPointURL
{
    TKGURLContents *urlContents = [[TKGURLContents alloc] initWithEndPointURL:endPointURL];
    [self.internalURLContentsObjects addObject:urlContents];
    return urlContents;
}

- (void) updateURLContents:(TKGURLContents *)urlContents withData:(NSData *)data
{
    [urlContents setURLContentsData:data];
}

- (void) updateURLContents:(TKGURLContents *)urlContents withLocalStorageURL:(NSURL *)localStorageURL
{
    [urlContents setLocalStorageURL:localStorageURL];
}

- (NSArray *) urlContentsObjects
{
    return self.internalURLContentsObjects;
}

@end
