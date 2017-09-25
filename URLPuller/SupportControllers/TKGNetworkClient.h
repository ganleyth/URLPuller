//
//  TKGNetworkClient.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKGNetworkClient : NSObject

+ (void) performDataTaskForURL:(NSURL *)url withCompletion:(void (^)(NSData*, NSError*))completion;

@end
