//
//  ViewController.m
//  SAVPlayer
//
//  Created by Superman on 2018/6/24.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
#import "SPlayer.h"
#import "YYModel.h"

#import "SVideo.h"
#import "SVideoCell.h"
#import "AFNetworking.h"
#import "SVideoPlayController.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSMutableArray *videoArray;

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *myTableView=[[UITableView alloc]init];
    myTableView.frame=CGRectMake(0, 0, screenW, screenH);
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [self.view addSubview:myTableView];
    _myTableView=myTableView;
    
    self.tid = @"T1464751736259";
    self.index = 0;
    
    self.videoArray = [NSMutableArray array];
    // 请求地址
    NSString *urlString = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/Tlist/%@/%zd-10.html",self.tid,self.index];
    
    [self getWithUrl:urlString params:nil success:^(NSDictionary *responseObject) {
        NSArray *array = responseObject[self.tid];
        for (NSDictionary *dict in array) {
            SVideo *video = [SVideo yy_modelWithDictionary:dict];
            [self.videoArray addObject:video];
        }
        [self.myTableView reloadData];
        
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.myTableView.rowHeight = 205;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.videoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVideoCell *cell = [SVideoCell videoCellWithTableView:tableView];
    SVideo *video = self.videoArray[indexPath.row];
    
    cell.video = video;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SVideo *video = self.videoArray[indexPath.row];

    SVideoPlayController *vc = [[SVideoPlayController alloc] init];
    vc.video = video;
    
    [self.navigationController pushViewController:vc animated:YES];
    //    XHVideoCell *cell = (XHVideoCell *)[tableView cellForRowAtIndexPath:indexPath];
    //    self.player.mediaPath = video.mp4_url;
    //    self.player.frame = cell.videoImageView.bounds;
    //    [cell addSubview:self.player];
    //    self.selectCell = cell;
    //    self.selectIndexPath = indexPath;
}

- (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //发送get请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //加载成功,把数据回调回去
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
