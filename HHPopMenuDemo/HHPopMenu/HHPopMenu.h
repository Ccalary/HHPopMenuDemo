//
//  HHPopMenu.h
//  HHPopMenuDemo
//
//  Created by chh on 2017/11/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHPopMenuSetting;

@interface HHPopMenu : UIView

@property (nonatomic, strong) HHPopMenuSetting *setting;

-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height;

/**
 初始化方法
 @param origin 三角的顶点位置
 @param view 自定义View
 @return view
 */
-(instancetype)initWithOrigin:(CGPoint)origin andCustomView:(UIView *)view;

//显示
- (void)popView;
//移除
- (void)dismiss;
@end

//默认设置
@interface HHPopMenuSetting : NSObject
@property (nonatomic, strong) UIColor *backgroundColor; //背景色（和箭头颜色保持一致），默认黑色透明(0.7)
@property (nonatomic, assign) CGFloat cornerRadius;     //圆角，默认4.0
@property (nonatomic, assign) CGFloat minMargin;        //距离两侧最小的间隙，默认10.0

+ (HHPopMenuSetting *)defaultSetting;
@end
