//
//  TKGMockData.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGMockData.h"

@implementation TKGMockData

+ (NSArray *) mockURLs
{
    NSURL *url0 = [[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png"];
    NSURL *url1 = [[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"];
    NSURL *url2 = [[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/female/25.png"];
    NSURL *url3 = [[NSURL alloc] initWithString:@"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png"];
    
    return [[NSArray alloc] initWithObjects: url0, url1, url2, url3, nil];
}

@end
