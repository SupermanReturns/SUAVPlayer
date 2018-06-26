//
//  SPlayerViewTopView.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SPlayerViewTopView.h"
#import "Masonry.h"
#define buttonWH 44
#define SVideoName(file) [@"PlayerTool.bundle" stringByAppendingPathComponent:file]

@interface SPlayerViewTopView()
@property (nonatomic, weak) UILabel *titleLabel;

@end


@implementation SPlayerViewTopView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:SVideoName(@"player_touming2@x")]];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        titleLabel.numberOfLines = 2;
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        
        UIButton *backButton = [[UIButton alloc] init];
        self.backButton = backButton;
        [backButton setImage:[UIImage imageNamed:SVideoName(@"player_back")] forState:UIControlStateNormal];
        [self addSubview:backButton];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(buttonWH, buttonWH));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backButton.mas_right);
        make.top.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
}
- (void)setTitle:(NSString *)title{
    _title  = title;
    self.titleLabel.text = title;
}


@end




















