//
//  AppDelegate.h
//  ImageURLProtocol
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong)  Reachability *reachability;


@end

