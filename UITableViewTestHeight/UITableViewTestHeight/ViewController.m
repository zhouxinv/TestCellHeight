//
//  ViewController.m
//  UITableViewTestHeight
//
//  Created by gewei on 2020/4/7.
//  Copyright © 2020 gewei. All rights reserved.
//

#import "ViewController.h"
#import "ACLabelTableViewCell.h"

static NSString *const kACLiveAnchorListCell = @"ACLabelTableViewCell";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tvAnchorList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubViewsAndConstraints];
}

#pragma mark - createSubViewsAndConstraints
- (void)createSubViewsAndConstraints {
    _tvAnchorList = [[UITableView alloc] init];
    _tvAnchorList.dataSource = self;
    _tvAnchorList.delegate = self;
    _tvAnchorList.estimatedRowHeight = 155.f;
    _tvAnchorList.rowHeight = UITableViewAutomaticDimension;
    _tvAnchorList.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tvAnchorList.backgroundColor = [UIColor lightGrayColor];
    _tvAnchorList.showsVerticalScrollIndicator = NO;
    _tvAnchorList.showsHorizontalScrollIndicator = NO;
    [_tvAnchorList registerClass:[ACLabelTableViewCell class] forCellReuseIdentifier:kACLiveAnchorListCell];
    [self.view addSubview:_tvAnchorList];
    _tvAnchorList.frame = self.view.bounds;
}

#pragma mark - Private API
- (NSArray<NSString *> *)dataSource {
    
    return @[@"tableView cell 自适应在我们的日常开发中经常会用到，假如你使用的是autolayout布局并且最低支持的版本是8.0及以上，本文可能会对你有所帮助",
    @"** 解释：iOS8以后苹果为我们提供了一个 estimatedRowHeight 和 UITableViewAutomaticDimension 属性，直译过来分别为 预期高度和 tableView自动尺寸**，第一段代码的意思是设置tableView的预期高度为80并且设置tableView的行高为自动计算行高后所得到的值(当然这两个属性也可以通过相应的代理方法进行设置)，cellForRow和我们以往一样。这样在约束好以后，它就会自动帮我算好行高，可以这么理解，系统会帮我们把cell的行高算好，然后自动把这个值匹配给我们相应的cell。"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self dataSource].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *liveItemModel = [self dataSource][indexPath.row];
    ACLabelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kACLiveAnchorListCell];
    cell.label.text = liveItemModel;
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ACLiveAccountItemModel *liveItemModel = (ACLiveAccountItemModel *)[self dataSource][indexPath.row];
//    return liveItemModel.cellHeight;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}



@end
