//
//  SPlayerViewBottomView.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class SPlayerViewBottomView;
@class SPlayerProgressView;
@protocol SPlayerViewBottomViewDelegate <NSObject>

@optional
- (void)playerViewBottomView:(SPlayerViewBottomView *)bottomView didClcikControlButton:(UIButton *)controlButton;
- (void)playerViewBottomView:(SPlayerViewBottomView *)bottomView didClcikFullScreenButton:(UIButton *)FullScreenButton;
- (void)playerViewBottomView:(SPlayerViewBottomView *)bottomView didUpdateProgressView:(SPlayerProgressView *)progressView;
- (void)playerViewBottomView:(SPlayerViewBottomView *)bottomView sliderPositionSliderUp:(SPlayerProgressView *)progressView;
- (void)playerViewBottomView:(SPlayerViewBottomView *)bottomView sliderPositionSliderDown:(SPlayerProgressView *)progressView;

@end

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
@property (nonatomic, strong) SPlayerProgressView *progressView;

@property (nonatomic, weak) id <SPlayerViewBottomViewDelegate> delegate;

- (void)updatePlayingTime:(CGFloat)readDuration;
- (void)updateTotalTime:(CGFloat)taotalDuration;
- (void)updateBufferringTime:(CMTime)bufferDuration;
@end
