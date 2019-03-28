//
//  FriendCircleViewController.m
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/27.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "FriendCircleViewController.h"
#import "FriendCircleCell.h"
#import "FriendCircleHeaderView.h"
#import "FriendCircleModel.h"
#import "FriendCirecleFrameModel.h"

@interface FriendCircleViewController ()<UITableViewDataSource,UITableViewDelegate,FriendCircleCellDelegate>

@property(nonatomic, strong) UITableView *tv;
@property(nonatomic, strong) NSMutableArray *frameArray;

@end

@implementation FriendCircleViewController

-(UITableView *)tv{
    if(!_tv){
        _tv = [[UITableView alloc]initWithFrame:CGRectMake(0, State_Bar_H, SCREENWIDTH, SCREENHEIGHT-State_Bar_H-SafeAreaBottom_H) style:UITableViewStylePlain];
        _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tv.delegate = self;
        _tv.dataSource = self;
        [_tv registerClass:[FriendCircleCell class] forCellReuseIdentifier:NSStringFromClass([FriendCircleCell class])];
//        [_tv registerClass:[FriendCircleHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([FriendCircleHeaderView class])];
    }
    return _tv;
}

-(NSMutableArray *)frameArray{
    if(_frameArray==nil){
        _frameArray = [NSMutableArray array];
    }
    return _frameArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
//    return self.frameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.frameArray.count;
//    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCirecleFrameModel *model = self.frameArray[indexPath.row];
    FriendCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FriendCircleCell class])];
    if(cell == nil){
        cell = [[FriendCircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([FriendCircleCell class])];
    }
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.frameModel = model;
//    [cell layoutSubviews];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCirecleFrameModel *frameModel = self.frameArray[indexPath.row];
    return frameModel.cellHeight;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    FriendCirecleFrameModel *model = self.frameArray[section];
//    FriendCircleHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([FriendCircleHeaderView class])];
//    if(headerView == nil){
//        headerView = [[FriendCircleHeaderView alloc]initWithReuseIdentifier:NSStringFromClass([FriendCircleHeaderView class])];
//    }
//    headerView.delegate = self;
//    headerView.tag = section;
//    headerView.frameModel = model;
//    return headerView;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    FriendCirecleFrameModel *frameModel = self.frameArray[section];
////    return frameModel.cellHeight;
//    return frameModel.headerViewHeight;
//}

- (void)refreshTableView:(FriendCircleCell *)cell{
    FriendCirecleFrameModel *frameModel = [self.frameArray objectAtIndex:cell.tag];
    FriendCircleModel *model = frameModel.model;
    model.allOrPart = !model.allOrPart;
    frameModel.model = model;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    CGRect frame=[cell convertRect:cell.bounds toView:window];
    NSLog(@"%@",NSStringFromCGRect(frame));
    CGFloat cellMinY = CGRectGetMinY(frame);
    NSLog(@"%f",cellMinY);
    //全局刷新单元格
//    [self.tv reloadData];
    //局部刷新单元格
    //当使用自定义cell时候的局部刷新方案
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cell.tag inSection:0];
    [self.tv reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //判断cell在tableview上的frame转换到window上面，如果cell的top小于状态栏和导航栏的高度，那么说明cell已经被导航栏遮住了一部分，为了避免重新删除单元格和创建单元格，cell上下滚动范围过大，就把该cell放到紧挨着导航栏底部放置
    if (cellMinY < Nav_Bar_H + State_Bar_H) {
        [self.tv scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    //当使用自定义头部时候的局部刷新方案
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerview.tag];
//    [self.tv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微信朋友圈";
    self.view.backgroundColor = [UIColor whiteColor];
    self.frameArray = [self creatDataSourceWithCount:20];
    [self.view addSubview:self.tv];
}

- (NSMutableArray *)creatDataSourceWithCount:(NSInteger)count{
    NSArray *iconArr = @[@"icon0.jpg",@"icon1.jpg",@"icon2.jpg",@"icon3.jpg",@"icon4.jpg"];
    NSArray *nameArr = @[@"宇文化及",@"长孙无极",@"成吉思汗",@"宇文成都",@"朱元璋"];
    NSArray *textArr = @[@"属于汉字文化圈的一些国家和民族也有庆贺新春的习俗。",
                         @"百节年为首，春节是中华民族最隆重的传统佳节，它不仅集中体现了中华民族的思想信仰。",
                         @"在不同时代，“正月初一”有不同名称",
                         @"在古代民间，人们从腊月的腊祭或腊月二十三或二十四的祭灶便开始“忙年”了，新年到正月十九日才结束。在现代，人们把春节定于农历正月初一，但一般至少要到农历正月十五（元宵节）新年才算结束。春节是个欢乐祥和的节日，是亲朋好友欢聚的日子，是人们增深感情的纽带。节日交流问候传递着亲朋乡里之间的亲情伦理，它是春节得以持存发展的重要要义。",
                         @"春节，即农历新年，是一年之岁首，传统意义上的“年节”。俗称新春、新岁、新年、新禧、年禧、大年等，口头上又称度岁、庆岁、过年、过大年。春节历史悠久，由上古时代岁首祈年祭祀演变而来。万物本乎天、人本乎祖，祈年祭祀、敬天法祖，报本反始也。春节的起源蕴含着深邃的文化内涵，在传承发展中承载了丰厚的历史文化底蕴。在春节期间，全国各地均有举行各种庆贺新春活动，热闹喜庆气氛洋溢；这些活动以除旧布新、迎禧接福、拜神祭祖、祈求丰年为主要内容，形式丰富多彩，带有浓郁的各地域特色，凝聚着中华文明的文化精华。"
                         ];
    NSArray *imageArr = @[ @"100.jpg",@"101.jpg",@"102.jpg",@"103.jpg",@"104.jpg",@"105.jpg",@"106.jpg",@"107.jpg",@"108.jpg"];
    NSMutableArray *resArr = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        FriendCircleModel *model = [FriendCircleModel new];
        model.iconStr = iconArr[iconRandomIndex];
        model.nameStr = nameArr[nameRandomIndex];
        model.contentStr = textArr[contentRandomIndex];
        model.allOrPart = NO;
        int randomPic = arc4random_uniform(9)+1;
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < randomPic; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:imageArr[randomIndex]];
        }
        if (temp.count) {
            model.imageArr = [temp copy];
        }
        FriendCirecleFrameModel *frameModel = [[FriendCirecleFrameModel alloc]init];
        frameModel.model = model;
        [resArr addObject:frameModel];
    }
    return [resArr mutableCopy];
}

@end
