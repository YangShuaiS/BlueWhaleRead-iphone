//
//  ZhiShiShuNEiRong.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuNEiRong.h"

@implementation ZhiShiShuNEiRong{
    FLAnimatedImageView * imageview;
    BaseLabel * label;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    imageview = [FLAnimatedImageView new];
    imageview.layer.masksToBounds = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x44, 0x33, 0x33) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"爱上大声哭了多久爱是快乐经典款啦佳世客来得及爱讲道理卡建档立卡达拉斯垃圾垃圾收到了"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageview.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
}
- (void)addimage{

                [self->imageview sd_setImageWithURL:[NSURL URLWithString:@"http://a.hiphotos.baidu.com/image/pic/item/0824ab18972bd407b564b0fd70899e510fb3090a.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    [self->imageview mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(image.size.width);
                        make.height.mas_equalTo(image.size.height);
                    }];
                }];
}
@end
