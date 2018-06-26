//
//  SPlayerViewBottomView.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SPlayerViewBottomView.h"
#import "SPlayerProgressView.h"
#import "Masonry.h"
#define buttonWH 44
#define SVideoName(file) [@"PlayerTool.bundle" stringByAppendingPathComponent:file]

@interface SPlayerViewBottomView()

@end

@implementation SPlayerViewBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:SVideoName(@"player_touming2@x")]];

        UILabel *currentTimeLabel = [[UILabel alloc] init];
        self.currentTimeLabel = currentTimeLabel;
        currentTimeLabel.textAlignment = NSTextAlignmentCenter;
        currentTimeLabel.font = [UIFont systemFontOfSize:14];
        currentTimeLabel.textColor = [UIColor whiteColor];
        currentTimeLabel.text = @"00:00";
        [self addSubview:currentTimeLabel];
        
        UILabel *totalTimeLabel = [[UILabel alloc] init];
        totalTimeLabel.text = @"99:99";
        totalTimeLabel.textAlignment = NSTextAlignmentCenter;
        totalTimeLabel.font = [UIFont systemFontOfSize:14];
        totalTimeLabel.textColor = [UIColor whiteColor];
        self.totalTimeLabel = totalTimeLabel;
        [self addSubview:totalTimeLabel];
        
        UIButton *controlButton = [[UIButton alloc ] init];
        [controlButton setImage:[UIImage imageNamed:SVideoName(@"player_bofang")] forState:UIControlStateNormal];
        controlButton.selected = YES;
        [controlButton setImage:[UIImage imageNamed:SVideoName(@"player_pause")] forState:UIControlStateSelected];
        [controlButton addTarget:self action:@selector(controlButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.controlButton = controlButton;
        [self addSubview:controlButton];
        
        SPlayerProgressView *progressView = [SPlayerProgressView initilzerProgressViewWithFrame:CGRectMake(0, 10, 375, 20)];
        self.progressView = progressView;
        //进度条的拖拽事件
        [progressView addTarget:self action:@selector(sliderChangeValue:)  forControlEvents:UIControlEventValueChanged];
        //进度条的点击事件
        [progressView addTarget:self action:@selector(positionSliderUp:) forControlEvents:UIControlEventTouchUpInside];
        [progressView addTarget:self action:@selector(positionSliderUp:) forControlEvents:UIControlEventTouchUpOutside];
        [progressView addTarget:self action:@selector(positionSliderDown:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:progressView];
        
        UIButton *fullScreenButton = [[UIButton alloc ] init];
        [fullScreenButton setImage:[UIImage imageNamed:SVideoName(@"player_fullscreen")] forState:UIControlStateNormal];
        [fullScreenButton setImage:[UIImage imageNamed:SVideoName(@"player_embeddedscreen")] forState:UIControlStateSelected];
        [fullScreenButton addTarget:self action:@selector(fullScreenButtonClcik:) forControlEvents:UIControlEventTouchUpInside];
        self.fullScreenButton = fullScreenButton;
        [self addSubview:fullScreenButton];
    }
    return self;
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.controlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(buttonWH, buttonWH));
    }];
    [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.controlButton.mas_right);
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, buttonWH));
    }];
    [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.controlButton.mas_right);
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, buttonWH));
    }];
    
    [self.fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWH, buttonWH));
        make.top.right.equalTo(self);
    }];
    [self.totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self.fullScreenButton.mas_left).offset(-8);
        make.size.mas_equalTo(CGSizeMake(50, buttonWH));
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentTimeLabel.mas_right).offset(8);
        make.right.equalTo(self.totalTimeLabel.mas_left).offset(-8);
        make.centerY.equalTo(self);
        make.height.equalTo(@(18));
    }];
    
}



@end



























