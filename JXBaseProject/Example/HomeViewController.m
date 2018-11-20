//
//  HomeViewController.m
//  StandardPj
//
//  Created by 徐沈俊杰 on 2018/7/11.
//  Copyright © 2018年 JX. All rights reserved.
//

#import "HomeViewController.h"
#import "UserCenterViewController.h"

#define kCellHeight 50
//沿Y轴偏移一屏的偏移量
#define kScreenOffSetY (kScreenHeight - (kTabHeight + kNavHeight + kStatusHeight))

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.backgroundColor = [UIColor getColor:@"FC9BAE"];
    [self addSubviews];
    [self setupFrame];
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了cell");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [UITableViewCell new];
    //cell颜色（红蓝循环）
    if(indexPath.row%2==0){
        cell.backgroundColor = [UIColor blueColor];
    }else{
        cell.backgroundColor = [UIColor redColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor greenColor];
//    
//    return view;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return kCellHeight;
//}
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view layoutIfNeeded];

    CGPoint contentOffset = scrollView.contentOffset;
    CGFloat contentOffsetY = contentOffset.y;
    
    NSLog(@"y=%f", contentOffsetY);

    //导航栏上移
    CGFloat percent = 1 - (contentOffsetY / -(kScreenOffSetY-kTabHeight));
    if (percent >= 0 && percent <= 1) {
        [self.navigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(-(kStatusHeight+kNavHeight) * percent * 2);
        }];
    }

    self.navigationBar.backgroundColor = [UIColor getColor:@"FC9BAE" andAlpha:(1-percent * 2)];
}

#pragma  makr - Events Response
- (void)nextButtonPressed:(id)sender {
    UserCenterViewController *vc = [[UserCenterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Method
- (void)addSubviews {
    [self.navigationBar.navigationView addSubview:self.nextButton];
    [self.view addSubview:self.bgView];
}

- (void)setupFrame {
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationBar.navigationView.mas_centerY);
        make.right.equalTo(self.navigationBar.navigationView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationBar.navigationView.mas_bottom);
        make.left.right.and.bottom.equalTo(self.view);
    }];
    
}

#pragma mark - Setting And Getting
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor yellowColor];
    }

    return _bgView;
}

- (UIButton *)nextButton  {
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setTitle:@"aaa" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _nextButton;
}

@end
