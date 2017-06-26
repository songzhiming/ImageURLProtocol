//
//  AppDelegate.m
//  ImageURLProtocol
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "AppDelegate.h"
#import "ImageURLProtocol.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.reachability  = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [self.reachability startNotifier];
    [NSURLProtocol registerClass:[ImageURLProtocol class]];
    return YES;
}



@end
