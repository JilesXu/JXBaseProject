//
//  JXNavigationBar.m
//  StandardPj
//
//  Created by 徐沈俊杰 on 2018/7/17.
//  Copyright © 2018年 JX. All rights reserved.
//

#import "JXNavigationBar.h"

#define kNavBtnWidth 20
#define kNavBtnHeight 20

@interface JXNavigationBar()

@end

@implementation JXNavigationBar

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
        [self setupFrame];
    }
    
    return self;
}

#pragma mark - Event Response
- (void)goBackBtnPressed:(UIButton *)sender {
    if (self.goBackBtnPressedBlock) {
        self.goBackBtnPressedBlock(sender);
    }
}


#pragma mark - Method
- (void)addSubviews {
    [self addSubview:self.navigationView];
    [self.navigationView addSubview:self.goBackBtn];
}

- (void)setupFrame {
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(kStatusHeight);
        make.left.right.and.bottom.equalTo(self);
    }];
    
    [self.goBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navigationView.mas_left);
        make.centerY.equalTo(self.navigationView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(kNavBtnWidth, kNavBtnHeight));
    }];

}

#pragma mark - Setting And Getting
- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusHeight, CGRectGetWidth(self.bounds), 0)];
        _navigationView.backgroundColor = [UIColor clearColor];
        _navigationView.userInteractionEnabled = YES;
    }
    
    return _navigationView;
}

- (UIButton *)goBackBtn {
    if (!_goBackBtn) {
        _goBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _goBackBtn.frame = CGRectMake(0,kStatusHeight, kNavBtnWidth, kNavBtnHeight);
        [_goBackBtn setImage:[UIImage imageNamed:@"Flow_imageGoBack"] forState:UIControlStateNormal];
        [_goBackBtn setBackgroundColor:[UIColor redColor]];
        [_goBackBtn addTarget:self action:@selector(goBackBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_goBackBtn setAdjustsImageWhenHighlighted:NO];
    }
    
    return _goBackBtn;
}

@end
