//
//  ZhiShiShuScroVuew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuScroVuew.h"
#import "ZhiShiShuView.h"
#import "ZhiShiSHuLeftView.h"

@implementation ZhiShiShuScroVuew{
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    BOOL Start;
    
    NSInteger next;
    BaseView * leftview;
    
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
    next = 1;
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    ZSSView = [ZhiShiShuView new];
    [scrollView addSubview:ZSSView];
    [ZSSView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->scrollView);
        make.width.mas_equalTo(WIDTH*self->next);
    }];
    
    leftView = [ZhiShiSHuLeftView new];
    [scrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView);
        make.bottom.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView);
        make.width.mas_equalTo(LENGTH(1));
    }];
    
    BaseView * rightview = [BaseView new];
    rightview.backgroundColor = [UIColor redColor];
    [scrollView addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(self->scrollView);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    rightview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneButton)];
    [rightview addGestureRecognizer:tap];
    
    leftview = [BaseView new];
    leftview.backgroundColor = [UIColor blackColor];
    [self addSubview:leftview];
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    leftview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoButton)];
    [leftview addGestureRecognizer:tapp];
    leftview.hidden = YES;

}

- (void)oneButton{
    next++;
    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WIDTH*self->next);
    }];
    if (next>1) {
        leftview.hidden = NO;
    }else{
        leftview.hidden = YES;
    }
}
- (void)twoButton{
    next--;
    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WIDTH*self->next);
    }];
    if (next>1) {
        leftview.hidden = NO;
    }else{
        leftview.hidden = YES;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->scrollView).with.offset(scrollView.contentOffset.x);
    }];
    if (Start == NO) {
        [UIView animateWithDuration:0 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(20));
            }];
//            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = YES;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (Start == YES) {
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(1));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (Start == YES) {
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(1));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = NO;
    }
}

@end
