//
//  ImageURLProtocol.m
//  ImageURLProtocol
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "ImageURLProtocol.h"
#import "Reachability.h"
#import "AppDelegate.h"

@implementation ImageURLProtocol


+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    NSString *scheme = [[request URL] scheme];
    if ([scheme caseInsensitiveCompare:@"http"] == NSOrderedSame ||
        [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame) {
        if ([request.URL.pathExtension isEqualToString:@""]) {
            NSLog(@"request----%@",request);
            return NO;
        }
        NSLog(@"lowercaseString---%@",[request.URL.pathExtension lowercaseString]);
        if ([[request.URL.absoluteString lowercaseString] hasSuffix:@"jpg"] ||
            [[request.URL.absoluteString lowercaseString] hasSuffix:@"png"] ||
            [[request.URL.absoluteString lowercaseString] hasSuffix:@"gif"] ||
            [[request.URL.absoluteString lowercaseString] hasSuffix:@"jpeg"]) {
            return YES;
        }
        if ([[request.URL.pathExtension lowercaseString] caseInsensitiveCompare:@"jpg"] ||
            [[request.URL.pathExtension lowercaseString] caseInsensitiveCompare:@"png"] ||
            [[request.URL.pathExtension lowercaseString] caseInsensitiveCompare:@"gif"] ||
            [[request.URL.pathExtension lowercaseString] caseInsensitiveCompare:@"jpeg"]) {//区分是否是图片 还得优化
            if ([self isReachableViaWWAN]) {
                return YES;
            }
            NSLog(@"request----%@",request);
            return NO;
        }
        NSLog(@"request----%@",request);
        return NO;
    }
    return NO;
}
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    return request;
}

- (void)startLoading
{
}

- (void)stopLoading
{
}

+ (BOOL)isReachableViaWWAN
{
    Reachability *reachability = ((AppDelegate *)[UIApplication sharedApplication].delegate).reachability;
    return !reachability.isReachableViaWWAN;
}

@end
