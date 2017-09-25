//
//  TKGFileSystemController.m
//  URLPuller
//
//  Created by Thomas Ganley on 9/25/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

#import "TKGFileSystemController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation TKGFileSystemController

+ (NSURL *) urlAfterSavingData:(NSData *)data forEndPointURL:(NSURL *)endPointURL
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    NSString *pathComponent = [TKGFileSystemController sha1RepresentationOfURL:endPointURL];
    NSString *pathComponentPlusExtension = [NSString stringWithFormat:@"%@.downloaded", pathComponent];
    
    NSString *completeLocalPath = [path stringByAppendingPathComponent:pathComponentPlusExtension];
    
    return [NSURL fileURLWithPath:completeLocalPath];
}

+ (NSString *) sha1RepresentationOfURL:(NSURL *)url
{
    NSString *urlString = url.absoluteString;
    NSData *data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%2x", digest[i]];
    }
    
    return output;
}

@end
