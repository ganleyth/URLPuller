//
//  TKGURLContents.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGURLContents.h"

@implementation TKGURLContents

- (instancetype) initWithEndPointURL:(NSURL *)endPointURL
{
    self = [super init];
    
    if (self) {
        _endPointURL = [endPointURL copy];
    }
    
    return self;
}

@end
