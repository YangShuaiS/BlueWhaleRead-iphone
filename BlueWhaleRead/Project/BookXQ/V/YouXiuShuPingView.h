//
//  YouXiuShuPingView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ClickBlock)(void);//

@interface YouXiuShuPingView : BaseView
@property (nonatomic, strong) BookXQBookReview* model;
@property(nonatomic,strong)ClickBlock block;

@end
