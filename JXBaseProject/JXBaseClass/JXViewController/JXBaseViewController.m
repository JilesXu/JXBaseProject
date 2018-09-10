//
//  JXBaseViewController.m
//  StandardPj
//
//  Created by 徐沈俊杰 on 2018/7/11.
//  Copyright © 2018年 JX. All rights reserved.
//

#import "JXBaseViewController.h"

#define kNavBtnWidth 20
#define kNavBtnHeight 20

@interface JXBaseViewController ()

@end

@implementation JXBaseViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self addBaseSubviews];
    [self setupBaseFrame];
}

#pragma mark - Method
- (void)addBaseSubviews {
    [self.view addSubview:self.navigationBar];
}

- (void)setupBaseFrame {
    [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.and.right.equalTo(self.view);
        make.height.mas_equalTo(kStatusHeight + kNavHeight);
    }];
}

#pragma  mark - Setting And Getting
- (JXNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[JXNavigationBar alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _navigationBar.goBackBtnPressedBlock = ^(UIButton *sender) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    
    return _navigationBar;
}
@end
