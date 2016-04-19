//
//  PBSliderView.h
//  chongBa
//
//  Created by 左坤 on 16/3/15.
//  Copyright © 2016年 chongBa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PBSliderViewDelegate <NSObject>

-(void)PBSliderViewDidIndex:(NSInteger)index;

@end
@interface PBSliderView : UIView
@property (nonatomic,weak)id<PBSliderViewDelegate> delegate;
@property (nonatomic,assign)NSInteger indexProgress;
-(instancetype)initWithFrame:(CGRect)frame Array:(NSArray<UIView*>*)array;
@end
