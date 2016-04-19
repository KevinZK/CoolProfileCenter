//
//  PBSliderView.m
//  chongBa
//
//  Created by 左坤 on 16/3/15.
//  Copyright © 2016年 chongBa. All rights reserved.
//

#import "PBSliderView.h"

@interface PBSliderView ()
@property (nonatomic,strong)UIView *sliderView;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,assign)BOOL isUseIndexProgress;
@property (nonatomic,assign)NSInteger width;
@property (nonatomic,assign)NSInteger height;
@property (nonatomic,assign)CGFloat slider_center_x;
@property (nonatomic,assign)CGFloat slider_center_y;
@end

@implementation PBSliderView
-(UIView *)sliderView{
    if (!_sliderView) {
        _sliderView = [[UIView alloc]initWithFrame:CGRectMake(20, self.height-10, self.width-35, 3)];
        _sliderView.backgroundColor = [UIColor blackColor];
        self.slider_center_x = _sliderView.center.x;
        self.slider_center_y = _sliderView.center.y;
    }
    return _sliderView;
}
-(void)setIndexProgress:(NSInteger)indexProgress{
    _indexProgress = indexProgress;
    self.isUseIndexProgress = YES;
        self.sliderView.center = CGPointMake(self.slider_center_x + _indexProgress*self.width, self.slider_center_y);
  
    
    
}
-(instancetype)initWithFrame:(CGRect)frame Array:(NSArray<UIView *> *)array{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitWithArray:array];
    }
    return self;
}
-(void)commonInitWithArray:(NSArray<UIView *> *)array{
    self.width = self.frame.size.width/array.count;
    self.height = self.frame.size.height;
    [self addSubview:self.sliderView];
    [array enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(idx*self.width, 0, self.width, self.height-3);
        obj.userInteractionEnabled = YES;
        obj.tag = idx +10;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPressed:)];
        [obj addGestureRecognizer:tap];
        [self addSubview:obj];
    }];
    
}
#pragma mark --- 事件监听
-(void)tapPressed:(UITapGestureRecognizer *)sender{
    self.index = sender.view.tag - 10;
    [UIView animateWithDuration:0.2 animations:^{
        self.sliderView.center = CGPointMake(self.slider_center_x+self.index*self.width, self.slider_center_y);
    }];
    
    
    if ([_delegate respondsToSelector:@selector(PBSliderViewDidIndex:)]) {
        [_delegate PBSliderViewDidIndex:self.index];
        
    }
    
}

@end
