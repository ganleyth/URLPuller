//
//  TKGMockData.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGMockData.h"

@interface TKGMockData ()

@property (nonatomic) NSArray *internalMockURLs;

@end

@implementation TKGMockData

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _internalMockURLs = [[NSArray alloc] initWithObjects:@"", @"", @"", nil];
    }
    
    return self;
}

- (NSArray *)mockURLs
{
    return [[NSArray alloc] init];
}

@end
