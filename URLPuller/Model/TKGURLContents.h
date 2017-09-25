//
//  TKGURLContents.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKGURLContents : NSObject

- (instancetype) initWithEndPointURL:(NSURL *)endPointURL;

@property (nonatomic, copy, readonly) NSURL *endPointURL;
@property (nonatomic) NSData *URLContentsData;
@property (nonatomic, copy) NSURL *localStorageURL;

@end
