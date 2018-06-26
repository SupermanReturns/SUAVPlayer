//
//  SPlayerProgressView.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPlayerProgressView : UISlider

+ (instancetype)initilzerProgressViewWithFrame:(CGRect)frame;

@property (nonatomic, assign) CGFloat progressWidth;
@property (nonatomic, assign) CGFloat totalLength;


@property (nonatomic, strong) UIColor *bufferProgressTintColor;
@property (nonatomic, strong) UIColor *bufferTintColor;

@property (nonatomic, assign) CGFloat bufferProgress;
@property (nonatomic, assign) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (void)setBufferProgress:(CGFloat)bufferProgress animated:(BOOL)animated;


@end
