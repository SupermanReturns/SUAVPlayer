//
//  SPlayerViewBottomView.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SPlayerViewBottomView : UIView

/**
 *  当前时间
 */
@property (nonatomic, weak) UILabel *currentTimeLabel;
/**
 *  总时间
 */
@property (nonatomic, weak) UILabel *totalTimeLabel;
/**
 *  控制button
 */
@property (nonatomic, weak) UIButton *controlButton;

/**
 *  全屏 button
 */
@property (nonatomic, weak) UIButton *fullScreenButton;
/**
 *  进度条
 */
@property (nonatomic, weak) XHPlayerProgressView *progressView;

@property (nonatomic, weak) id <XHPlayerViewBottomViewDelegate> delegate;

- (void)updatePlayingTime:(CGFloat)readDuration;
- (void)updateTotalTime:(CGFloat)taotalDuration;
- (void)updateBufferringTime:(CMTime)bufferDuration;
@end
