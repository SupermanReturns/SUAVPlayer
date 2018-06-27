//
//  SVideoPlayController.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SVideoPlayController.h"
#import "SPlayer.h"
#import "SVideo.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface SVideoPlayController ()
@property (nonatomic, strong) SPlayer *player;

@end

@implementation SVideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (SPlayer *)player{
    if (!_player) {
        _player = [[SPlayer alloc] init];
        [self.view addSubview:_player];
        self.player.firstSuperView = self.view;
    }
    return _player;
}
- (void)setVideo:(SVideo *)video{
    _video = video;
    self.player.frame = CGRectMake(0, 100, screenW, 200);
    self.player.mediaPath = video.mp4_url;
    self.player.title = video.title;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.player close];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
