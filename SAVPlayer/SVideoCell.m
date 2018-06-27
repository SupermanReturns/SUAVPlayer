//
//  SVideoCell.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/26.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "SVideoCell.h"
#import "Masonry.h"
#import "SVideo.h"
#import "UIImageView+WebCache.h"

@interface SVideoCell()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *videoImageView;

@property(nonatomic,strong)UIImageView *authorImageView;

@property(nonatomic,strong)UILabel *authorTitle;
@property(nonatomic,strong)UILabel *playCountLabel;



@end
@implementation SVideoCell


+ (instancetype)videoCellWithTableView:(UITableView *)tableView{
    static NSString *cellName = @"autoTableViewCell";

    SVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SVideoCell"];
    if (cell == nil) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"XHVideoCell" owner:self options:nil].lastObject;
        cell = [[SVideoCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
    }
    return self;
}
-(void)layoutUI{
    UIImageView *videoImageView=[[UIImageView alloc]init];
    [self.contentView addSubview:videoImageView];
    _videoImageView=videoImageView;
    [videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@150);
    }];
    
    UILabel *titleLabel=[[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    _titleLabel=titleLabel;
    [titleLabel setFont:[UIFont systemFontOfSize:15]];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).offset(8);
        make.height.equalTo(@18);
    }];
    
    UIButton *playButton=[[UIButton alloc]init];
    [self.contentView addSubview:playButton];
    [playButton setImage:[UIImage imageNamed:@"audionews_index_play"] forState:UIControlStateNormal];
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    UIImageView *authorImageView=[[UIImageView alloc]init];
    [self.contentView addSubview:authorImageView];
    _authorImageView=authorImageView;
    [authorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.top.equalTo(self.videoImageView.mas_bottom).offset(8);
        make.size.mas_equalTo(CGSizeMake(40, 33.5));
    }];
    
    
    UILabel *authorTitle=[[UILabel alloc]init];
    [self.contentView addSubview:authorTitle];
    _authorTitle=authorTitle;
    [authorTitle setFont:[UIFont systemFontOfSize:13]];
    [authorTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.authorImageView.mas_right).offset(10);
        make.top.equalTo(self.videoImageView.mas_bottom).offset(16);
        make.size.mas_equalTo(CGSizeMake(50, 16));
    }];
    
    UILabel *playCountLabel=[[UILabel alloc]init];
    [self.contentView addSubview:playCountLabel];
    _playCountLabel=playCountLabel;
    [playCountLabel setFont:[UIFont systemFontOfSize:13]];
    [playCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.top.equalTo(self.videoImageView.mas_bottom).offset(16);
        make.size.mas_equalTo(CGSizeMake(50, 16));
    }];

    
    
}
- (void)setVideo:(SVideo *)video{
    _video = video;
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:video.cover]];
    
    [self.authorImageView sd_setImageWithURL:[NSURL URLWithString:video.topicImg]];
    
    self.titleLabel.text = video.title;
    self.authorTitle.text = video.topicName;
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd次播放",video.playCount];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end






























