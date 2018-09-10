//
//  JXBaseViewController.h
//  StandardPj
//
//  Created by 徐沈俊杰 on 2018/7/11.
//  Copyright © 2018年 JX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXNavigationBar.h"

@interface JXBaseViewController : UIViewController

/**
 自定义导航条容器，更换背景色时对此项操作，实际导航条边界为此控件
 */
@property (nonatomic, strong) JXNavigationBar *navigationBar;

@end
