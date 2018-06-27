//
//  SVideo.h
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVideo : NSObject

@property (nonatomic, copy) NSString *topicImg;
@property (nonatomic, copy) NSString *videosource;
@property (nonatomic, copy) NSString *mp4Hd_url;
@property (nonatomic, copy) NSString *topicSid;
@property (nonatomic, copy) NSString *topicDesc;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *m3u8_url;
@property (nonatomic, copy) NSString *m3u8Hd_url;
@property (nonatomic, copy) NSString *mp4_url;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *topicName;


@end
