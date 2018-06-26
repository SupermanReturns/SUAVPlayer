//
//  SForwardView.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SForwardView.h"
#import "Masonry.h"
#define SVideoName(file) [@"PlayerTool.bundle" stringByAppendingPathComponent:file]

@interface SForwardView()
@property (nonatomic, weak) UIImageView *forwardImageView;
@property (nonatomic, weak) UIImageView *rewindImageView;
@end

@implementation SForwardView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = [UIColor whiteColor];
        timeLabel.font = [UIFont systemFontOfSize:15];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        //        time.backgroundColor = [UIColor redColor];
        self.timeLabel = timeLabel;
        timeLabel.text = @"99:99";
        [self addSubview:timeLabel];
        
        UIImageView *forwardImageView = [[UIImageView alloc] init];
        forwardImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:forwardImageView];
        
        self.forwardImageView = forwardImageView;
        forwardImageView.image = [UIImage imageNamed:SVideoName(@"kuaijin")];
        
        
        UIImageView *rewindImageView = [[UIImageView alloc] init];
        rewindImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:rewindImageView];
        self.rewindImageView = rewindImageView;
        rewindImageView.image = [UIImage imageNamed:SVideoName(@"kuaitui")];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 40));
        make.centerX.equalTo(self);
    }];
    [self.forwardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 40));
        make.left.equalTo(self.timeLabel.mas_width);
    }];
    [self.rewindImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 40));
        make.right.equalTo(self.timeLabel.mas_left);
    }];
}

- (void)setMode:(SForwardViewMode)mode{
    _mode = mode;
    switch (mode) {
        case SHForwardViewModeRewind:
            self.forwardImageView.hidden=YES;
            self.rewindImageView.hidden=NO;
            break;
        case SForwardViewModeForward:
            self.rewindImageView.hidden=YES;
            self.forwardImageView.hidden=NO;
            break;
        default:
            break;
    }
}
@end























