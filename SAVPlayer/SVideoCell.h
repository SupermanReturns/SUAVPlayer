//
//  SVideoCell.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SVideo;

@interface SVideoCell : UITableViewCell
@property (nonatomic, strong) SVideo *video;

+ (instancetype)videoCellWithTableView:(UITableView *)tableView;

@end
