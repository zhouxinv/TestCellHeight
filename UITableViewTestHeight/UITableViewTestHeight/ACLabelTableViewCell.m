//
//  ACLabelTableViewCell.m
//  UITableViewTestHeight
//
//  Created by gewei on 2020/4/7.
//  Copyright © 2020 gewei. All rights reserved.
//

#import "ACLabelTableViewCell.h"
#import "Masonry.h"

@implementation ACLabelTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViewsAndConstraints];
    }
    return self;
}
#pragma mark - createSubViewsAndConstraints
- (void)createSubViewsAndConstraints {
    UILabel *label = [[UILabel alloc] init];
    _label = label;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor brownColor];
    [self.contentView addSubview:label];
    CGFloat labelT = 10;
    CGFloat labelL = 10;
    CGFloat labelW =  self.contentView.bounds.size.width - 20;
    CGFloat labelH = self.contentView.bounds.size.height - 20;
//    label.frame = CGRectMake(labelL, labelT, labelW, labelH);
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(10);
//        make.leading.mas_equalTo(10);
//        make.trailing.mas_equalTo(-10);
//        make.bottom.mas_equalTo(-10);
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}


@end
