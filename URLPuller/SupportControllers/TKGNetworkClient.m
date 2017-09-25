//
//  TKGNetworkClient.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGNetworkClient.h"

@implementation TKGNetworkClient

+ (void) performDataTaskForURL:(NSURL *)url withCompletion:(void (^)(NSData*, NSError*))completion
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    urlRequest.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData *data,
                                                                                                                      NSURLResponse *response,
                                                                                                                      NSError *error) {
        completion(data, error);
    }];
    
    [dataTask resume];
}

@end
