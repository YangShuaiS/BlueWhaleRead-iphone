//
//  TKJIEGUOMODEL.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKJIEGUOMODEL.h"

@implementation TKJIEGUOMODEL
+ (void)InitializeModel{
    [TKJIEGUOMODEL mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeBooks":@"AllBookListModel"};
    }];
}
@end
