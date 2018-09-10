//
//  JXRootUIService.h
//  JXBaseProject
//
//  Created by 徐沈俊杰 on 2018/9/10.
//  Copyright © 2018年 JX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXRootUIService : NSObject

+ (JXRootUIService *)shareInstance;

- (void)runApp;

@end
