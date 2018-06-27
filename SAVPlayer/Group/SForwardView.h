//
//  SForwardView.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SForwardViewModeForward,
    SForwardViewModeRewind
}SForwardViewMode;

@interface SForwardView : UIView

@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, assign) SForwardViewMode mode;

@end
