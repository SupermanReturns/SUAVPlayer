//
//  SVideo.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SVideo.h"
#import "YYModel.h"

@implementation SVideo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"desc" : @"description",
             };
}

@end
