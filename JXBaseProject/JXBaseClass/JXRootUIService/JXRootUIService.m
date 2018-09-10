//
//  JXRootUIService.m
//  JXBaseProject
//
//  Created by 徐沈俊杰 on 2018/9/10.
//  Copyright © 2018年 JX. All rights reserved.
//

#import "JXRootUIService.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
#import "UserCenterViewController.h"

@interface JXRootUIService()

@property (nonatomic, strong) JXTabBarController *tabBarController;

@end

@implementation JXRootUIService

static JXRootUIService *instance = nil;

+ (JXRootUIService *)shareInstance {
    static dispatch_once_t onceToken;
    if (instance == nil) {
        dispatch_once(&onceToken, ^{
            instance = [[JXRootUIService alloc] init];
        });
    }
    return instance;
}

- (void)runApp {
    [self createTab];
    
    // 如果第一次进入，显示用户引导，否则显示欢迎页
    NSUInteger launchTimes = [[NSUserDefaults standardUserDefaults] integerForKey:@"LaunchTimes"];
    
    if (launchTimes == 0) {
        [self showUserGuide];
        
    } else {
        
        [self showWelcome];
    }
}

- (void)createTab {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    JXNavigationController *homeNav = [[JXNavigationController alloc] initWithRootViewController:homeViewController];
    homeNav.navigationBar.translucent = NO; //导航栏设置不透明，坐标从导航栏下开始
    homeNav.delegate = self;
    
    self.tabBarController.viewControllers = [NSArray arrayWithObject:homeNav];
    
    [self showHomeTab];
}

- (void)showHomeTab {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = self.tabBarController;
}

- (void)showUserGuide {
    
}

- (void)showWelcome {
    
}

- (JXTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[JXTabBarController alloc] init];
    }
    
    return _tabBarController;
}

@end
