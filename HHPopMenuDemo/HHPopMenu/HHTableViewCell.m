//
//  HHTableViewCell.m
//  HHPopMenuDemo
//
//  Created by chh on 2017/11/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HHTableViewCell.h"
@interface HHTableViewCell()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *dividerLine;
@property (nonatomic, assign) CGFloat width, height;
@end

@implementation HHTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

//在init获取宽高是默认（340，44）,在这获取就是自定义的宽高了
- (void)layoutSubviews{
    [super layoutSubviews];
    self.width = self.contentView.frame.size.width;
    self.height = self.contentView.frame.size.height;
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.dividerLine];
}

- (UIImageView *)iconImageView{
    if (!_iconImageView){
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, (self.height - 30)/2.0, 30, 30)];
        _iconImageView.image = [UIImage imageNamed:@"write_24"];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame), 0, self.width - (self.iconImageView.frame.size.width + 5), self.height)];
        _titleLabel.text = @"收藏";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)dividerLine{
    if (!_dividerLine){
        _dividerLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 1, self.width, 1)];
        _dividerLine.backgroundColor = [UIColor whiteColor];
    }
    return _dividerLine;
}

@end
