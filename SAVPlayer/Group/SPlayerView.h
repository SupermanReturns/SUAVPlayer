//
//  SPlayerView.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPlayerViewTopView.h"
#import "SPlayerViewBottomView.h"
#import <AVFoundation/AVFoundation.h>

typedef enum : NSInteger{
    PanDirectionNone,
    PanDirectionUp,
    PanDirectionDown,
    PanDirectionRight,
    PanDirectionLeft
} PanDirection;

@protocol SPlayerViewDelegate <NSObject>
- (void)playerViewDidClickBackButton;
- (void)playViewDidDoubleTap;
- (void)playViewDidSwipeOver:(NSInteger)seconds;
- (void)playViewDidChangeVolume:(CGFloat)volume;
@end

@class SPlayer;

@interface SPlayerView : UIView
@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, readonly) AVPlayerLayer *playerLayer;

@property (nonatomic, strong) SPlayer *playerContainer;

@property (nonatomic, copy) NSString *videoFillMode;

- (void)showIndicator;
- (void)hideIndicator;
@property (nonatomic, weak) SPlayerViewTopView *topView;
@property (nonatomic, weak) SPlayerViewBottomView *bottomView;

@property (nonatomic, weak) id <SPlayerViewDelegate> delegate;


@property (nonatomic, assign) UIDeviceOrientation orientation;

@property (nonatomic, assign) PanDirection  direction;

/**
 *  如果从左滑倒右,快进/快退的时间,默认90s,根据widthSeconds/width计算划过屏幕尺寸快进的时间
 */
@property (nonatomic, assign) CGFloat widthSeconds;

@end


























