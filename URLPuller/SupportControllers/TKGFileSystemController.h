//
//  TKGFileSystemController.h
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKGFileSystemController : NSObject

+ (NSURL *) urlAfterSavingData:(NSData *)data forEndPointURL:(NSURL *)endPointURL;
+ (NSString *) sha1RepresentationOfURL:(NSURL *)url;
+ (NSInteger) lengthForDataAtLocalStorageURL:(NSURL *)localStorageURL;

@end
