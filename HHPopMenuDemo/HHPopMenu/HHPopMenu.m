//
//  HHPopMenu.m
//  HHPopMenuDemo
//
//  Created by chh on 2017/11/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HHPopMenu.h"
#import "HHTableView.h"

#define HSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define HSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TRIANGLE_HEIGHT  5.0f

@interface HHPopMenu()
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIView *holdView;
@property (nonatomic, strong) HHTableView *tableView;
@end

@implementation HHPopMenu

-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height{
    if (self = [super initWithFrame:CGRectMake(0, 0, HSCREEN_WIDTH, HSCREEN_HEIGHT)]){
        //默认配置
        self.setting = [HHPopMenuSetting defaultSetting];
        self.origin = origin;
        self.width = width;
        self.height = height;
        [self initView];
    }
    return self;
}

-(instancetype)initWithOrigin:(CGPoint)origin andCustomView:(UIView *)view{
    if (self = [super initWithFrame:CGRectMake(0, 0, HSCREEN_WIDTH, HSCREEN_HEIGHT)]){
        //默认配置
        self.setting = [HHPopMenuSetting defaultSetting];
        self.origin = origin;
        self.width = view.frame.size.width;
        self.height = view.frame.size.height;
        [self initView];
        
        [self.holdView addSubview:view];
    }
    return self;
}

- (void)initView{
    //背景色
    self.backgroundColor = [UIColor clearColor];
    
    self.holdView = [[UIView alloc] initWithFrame:CGRectMake(self.origin.x, self.origin.y, self.width, self.height)];
    self.holdView.backgroundColor = self.setting.backgroundColor;
    self.holdView.layer.cornerRadius = self.setting.cornerRadius;
    [self.holdView addSubview:self.tableView];
    [self addSubview:self.holdView];
}

- (HHTableView *)tableView{
    if (!_tableView){
        _tableView = [[HHTableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    }
    return _tableView;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    //获得处理的上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //开始位置
    CGFloat startX = self.origin.x;
    CGFloat startY = self.origin.y;
//    //开始一个起始路径
//    CGContextBeginPath(context);
//    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
//    CGContextMoveToPoint(context, startX, startY);
//    //设置下一个坐标点
//    CGContextAddLineToPoint(context, startX-TRIANGLE_HEIGHT, startY+TRIANGLE_HEIGHT);
//    //设置下一个坐标点
//    CGContextAddLineToPoint(context, startX+TRIANGLE_HEIGHT, startY+TRIANGLE_HEIGHT);
//
//    CGContextClosePath(context);
//    [self.holdView.backgroundColor setFill];
//    [self.backgroundColor setStroke];
//    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIColor *color = self.holdView.backgroundColor;
    [color set];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(startX, startY)];
    [bezierPath addLineToPoint:CGPointMake(startX-TRIANGLE_HEIGHT, startY+TRIANGLE_HEIGHT)];
    [bezierPath addLineToPoint:CGPointMake(startX+TRIANGLE_HEIGHT, startY+TRIANGLE_HEIGHT)];
    [bezierPath closePath];
    [bezierPath fill];
}

- (void)popView{
    [self hiddenAllSubViews:YES];
    
    self.holdView.backgroundColor = self.setting.backgroundColor;
    self.holdView.layer.cornerRadius = self.setting.cornerRadius;
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;
    
    CGFloat offsetX = self.origin.x - self.width/2.0;//偏移量,局中
    if (offsetX < self.setting.minMargin){//左侧
        offsetX = self.setting.minMargin;
    }else if ((offsetX + self.width) > (HSCREEN_WIDTH - self.setting.minMargin)){//右侧
        offsetX = HSCREEN_WIDTH - self.width - self.setting.minMargin;
    }
    
    self.holdView.frame = CGRectMake(self.origin.x, self.origin.y+TRIANGLE_HEIGHT, 0, 0);
    self.tableView.frame = CGRectZero;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
        self.holdView.frame = CGRectMake(offsetX, self.origin.y+TRIANGLE_HEIGHT, self.width,self. height);
        self.tableView.frame = CGRectMake(0, 0, self.width, self.height);
    }completion:^(BOOL finished) {
        [self hiddenAllSubViews:NO];
    }];
}

- (void)dismiss{
    [self hiddenAllSubViews:YES];
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.holdView.frame = CGRectMake(self.origin.x, self.origin.y+TRIANGLE_HEIGHT, 0,0);
    }completion:^(BOOL finished) {
        if (finished){
            [self removeFromSuperview];
        }
    }];
}

//点击消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    //如果触摸的不是holdView则隐藏
    if (![touch.view isEqual:self.holdView]) {
        [self dismiss];
    }
}

//subView显示或隐藏
- (void)hiddenAllSubViews:(BOOL)hidden{
    NSArray *subViews = [self.holdView subviews];
    for (UIView *view in subViews) {
        view.hidden = hidden;
    }
}
@end

#pragma mark - defaultSetting
@implementation HHPopMenuSetting
+ (HHPopMenuSetting *)defaultSetting{
    HHPopMenuSetting *setting = [[HHPopMenuSetting alloc] init];
    setting.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]; //背景色
    setting.cornerRadius = 4.0; //圆角
    setting.minMargin = 10.0; //距离两侧最小边距
    return setting;
}
@end
