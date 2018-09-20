//
//  ZhiShiShuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuView.h"
#import "ZhiShiShuNEiRong.h"
@implementation ZhiShiShuView{
    NSMutableArray * viewarray;
    ZhiShiShuNEiRong * lastview;
    CAShapeLayer * animLayer;

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
    animLayer = [CAShapeLayer layer];
    animLayer.shadowOpacity = 0.4;
    animLayer.shadowColor = [UIColor blackColor].CGColor;
    animLayer.shadowRadius = 2.0f;
    animLayer.shadowOffset = CGSizeMake(0,0);
    animLayer.lineWidth = 5.0f;
    animLayer.strokeColor = [UIColor yellowColor].CGColor;
    animLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:animLayer];
    
    viewarray = [NSMutableArray array];
    for (int i = 0; i <500 ; i++) {
//        @autoreleasepool {
        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
        [self addSubview:imageview];
        [viewarray addObject:imageview];
//        }
    }
    
    for (int i = 0; i < viewarray.count; i++) {
        ZhiShiShuNEiRong * view = viewarray[i];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws).with.offset(0);
                make.left.mas_equalTo(ws).with.offset(100);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(100);
                make.top.mas_equalTo(self->lastview.mas_bottom).with.offset(LENGTH(100));
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        for (int i = 0; i < self->viewarray.count; i++) {
                ZhiShiShuNEiRong * view = self->viewarray[i];
                [view addimage];
        }
    });
    

    

}

//- (void)huadong{
//    for (FLAnimatedImageView * view in self->viewarray) {
//        if([self isDisplayedInScreen:view]) {
//        [view sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537280288362&di=6068c52d40dc0949b0d9edab96ba7264&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F63d9f2d3572c11df419fbf63682762d0f703c220.jpg"]];
//        } else {
//
//            NSLog(@"不在屏幕内");
//        }
//    }
//}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 1; i < viewarray.count; i++) {
        ZhiShiShuNEiRong * starview = self->viewarray[i-1];
        ZhiShiShuNEiRong * endview = self->viewarray[i];
        CGPoint stars = starview.center;
        CGPoint ends = endview.center;
        [path moveToPoint:stars];
        [path addLineToPoint:ends];
    }
    animLayer.path = path.CGPath;
}

- (void)addviews{
    WS(ws);
    
    for (int i = 0; i <1000; i++) {
        FLAnimatedImageView * imageview = [FLAnimatedImageView new];
        imageview.layer.masksToBounds = YES;
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageview];
        [viewarray addObject:imageview];
    }
    FLAnimatedImageView * view = viewarray[1000-1];

    [lastview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(100);
        make.top.mas_equalTo(view.mas_bottom).with.offset(LENGTH(100));
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    for (int i = 2000; i < viewarray.count; i++) {
        FLAnimatedImageView * view = viewarray[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(100);
            make.top.mas_equalTo(self->lastview.mas_bottom).with.offset(LENGTH(100));
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
}

- (BOOL)isDisplayedInScreen:(FLAnimatedImageView *)view
{
    if (view == nil) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    UIWindow *win= [UIApplication sharedApplication].keyWindow;
    CGRect rect = [view convertRect:view.frame toView:win];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    // 若view 隐藏
    if (view.hidden) {
        return NO;
    }
    
    // 若没有superview
    if (view.superview == nil) {
        return NO;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  NO;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}
@end
