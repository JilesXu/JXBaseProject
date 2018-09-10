//
//  JXNavigationBar.h
//  StandardPj
//
//  Created by 徐沈俊杰 on 2018/7/17.
//  Copyright © 2018年 JX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GoBackBtnPressed)(UIButton *sender);

@interface JXNavigationBar : UIView

/**
 自定义导航条，视觉导航条边界为此控件
 */
@property (nonatomic, strong) UIView *navigationView;
/**
 返回上一级按钮
 */
@property (nonatomic, strong) UIButton *goBackBtn;
/**
 返回上一级按钮点击事件
 */
@property (nonatomic, strong) GoBackBtnPressed goBackBtnPressedBlock;

@end
