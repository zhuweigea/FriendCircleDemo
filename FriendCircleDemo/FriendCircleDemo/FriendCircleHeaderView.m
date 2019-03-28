//
//  FriendCircleCell.m
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/27.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "FriendCircleHeaderView.h"
#import "FriendCircleModel.h"
#import "FriendCirecleFrameModel.h"

@interface  FriendCircleHeaderView()

@end

@implementation FriendCircleHeaderView

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        [self createUI];
//    }
//    return self;
//}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.iconIV = [[UIImageView alloc]init];
    self.iconIV.clipsToBounds = YES;
    self.iconIV.layer.cornerRadius = 20;
    [self.contentView addSubview:self.iconIV];
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nameLabel];
    self.contentLbl = [[UILabel alloc]init];
    self.contentLbl.numberOfLines = 0;
    self.contentLbl.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.contentLbl];
    self.hideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.hideBtn setTitle:@"全部" forState:UIControlStateNormal];
    [self.hideBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.hideBtn addTarget:self action:@selector(allOrPart) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.hideBtn];
    self.ivOne = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivOne];
    self.ivTwo = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivTwo];
    self.ivThree = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivThree];
    self.ivFour = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivFour];
    self.ivFive = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivFive];
    self.ivSix = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivSix];
    self.ivSeven = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivSeven];
    self.ivEight = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivEight];
    self.ivNine = [[UIImageView alloc]init];
    [self.contentView addSubview:self.ivNine];
    self.ivOne.hidden = YES;
    self.ivTwo.hidden = YES;
    self.ivThree.hidden = YES;
    self.ivFour.hidden = YES;
    self.ivFive.hidden = YES;
    self.ivSix.hidden = YES;
    self.ivSeven.hidden = YES;
    self.ivEight.hidden = YES;
    self.ivNine.hidden = YES;
}

- (void)allOrPart{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(refreshTableView:)]) {
        [self.delegate refreshTableView:self];
    }
}

////#pragma mark --布局方法一
//- (void)setFriendCircleModel:(FriendCircleModel *)friendCircleModel{
//    _friendCircleModel = friendCircleModel;
//    self.iconIV.image = [UIImage imageNamed:friendCircleModel.iconStr];
//    self.nameLabel.text = friendCircleModel.nameStr;
//    self.contentLbl.text = friendCircleModel.contentStr;
//}
//
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    KWeakSelf;
//    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(HORIZONTAL_SPACING);
//        make.top.mas_equalTo(VERTICAL_SPACING);
//        make.width.height.mas_equalTo(40);
//    }];
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.iconIV.mas_right).offset(HORIZONTAL_SPACING);
//        make.top.mas_equalTo(VERTICAL_SPACING);
//    }];
//    [self.contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(VERTICAL_SPACING);
//        make.left.equalTo(weakSelf.iconIV.mas_right).offset(HORIZONTAL_SPACING);
//        make.width.mas_equalTo(SCREENWIDTH-HORIZONTAL_SPACING*3-icon_width);
//        make.bottom.equalTo(weakSelf.contentView);
//    }];
//}

#pragma mark --布局方法二
- (void)setFrameModel:(FriendCirecleFrameModel *)frameModel{
    _frameModel = frameModel;
    FriendCircleModel *model = frameModel.model;
    self.iconIV.image = [UIImage imageNamed:model.iconStr];
    self.iconIV.frame = frameModel.iconFrame;
    self.nameLabel.text = model.nameStr;
    self.nameLabel.frame = frameModel.nameFrame;
    self.contentLbl.text = model.contentStr;
    self.contentLbl.frame = frameModel.contentFrame;
    self.hideBtn.frame = frameModel.buttonFrame;
    CGRect frame = self.hideBtn.frame;
    if (CGRectEqualToRect(frame, CGRectZero) ) {
        self.hideBtn.hidden = YES;
    }else{
        self.hideBtn.hidden = NO;
        if(model.allOrPart){
            [self.hideBtn setTitle:@"收起" forState:UIControlStateNormal];
        }else{
            [self.hideBtn setTitle:@"全部" forState:UIControlStateNormal];
        }
    }
    self.ivOne.hidden = YES;
    self.ivTwo.hidden = YES;
    self.ivThree.hidden = YES;
    self.ivFour.hidden = YES;
    self.ivFive.hidden = YES;
    self.ivSix.hidden = YES;
    self.ivSeven.hidden = YES;
    self.ivEight.hidden = YES;
    self.ivNine.hidden = YES;
    switch (model.imageArr.count) {
        case 1:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivOne.frame = frameModel.ivOneFrame;
            break;
        }
        case 2:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            break;
        }
        case 3:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            break;
        }
        case 4:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivFour.frame = frameModel.ivFourFrame;
            break;
        }
        case 5:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-5]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivFour.frame = frameModel.ivFourFrame;
            self.ivFive.hidden = NO;
            self.ivFive.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivFive.frame = frameModel.ivFiveFrame;
            break;
        }
        case 6:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-6]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-5]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivFour.frame = frameModel.ivFourFrame;
            self.ivFive.hidden = NO;
            self.ivFive.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivFive.frame = frameModel.ivFiveFrame;
            self.ivSix.hidden = NO;
            self.ivSix.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivSix.frame = frameModel.ivSixFrame;
            break;
        }
        case 7:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-7]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-6]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-5]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivFour.frame = frameModel.ivFourFrame;
            self.ivFive.hidden = NO;
            self.ivFive.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivFive.frame = frameModel.ivFiveFrame;
            self.ivSix.hidden = NO;
            self.ivSix.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivSix.frame = frameModel.ivSixFrame;
            self.ivSeven.hidden = NO;
            self.ivSeven.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivSeven.frame = frameModel.ivSevenFrame;
            break;
        }
        case 8:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-8]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-7]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-6]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-5]];
            self.ivFour.frame = frameModel.ivFourFrame;
            self.ivFive.hidden = NO;
            self.ivFive.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivFive.frame = frameModel.ivFiveFrame;
            self.ivSix.hidden = NO;
            self.ivSix.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivSix.frame = frameModel.ivSixFrame;
            self.ivSeven.hidden = NO;
            self.ivSeven.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivSeven.frame = frameModel.ivSevenFrame;
            self.ivEight.hidden = NO;
            self.ivEight.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivEight.frame = frameModel.ivEightFrame;
            break;
        }
        case 9:{
            self.ivOne.hidden = NO;
            self.ivOne.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-9]];
            self.ivOne.frame = frameModel.ivOneFrame;
            self.ivTwo.hidden = NO;
            self.ivTwo.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-8]];
            self.ivTwo.frame = frameModel.ivTwoFrame;
            self.ivThree.hidden = NO;
            self.ivThree.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-7]];
            self.ivThree.frame = frameModel.ivThreeFrame;
            self.ivFour.hidden = NO;
            self.ivFour.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-6]];
            self.ivFour.frame = frameModel.ivFourFrame;
            self.ivFive.hidden = NO;
            self.ivFive.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-5]];
            self.ivFive.frame = frameModel.ivFiveFrame;
            self.ivSix.hidden = NO;
            self.ivSix.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-4]];
            self.ivSix.frame = frameModel.ivSixFrame;
            self.ivSeven.hidden = NO;
            self.ivSeven.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-3]];
            self.ivSeven.frame = frameModel.ivSevenFrame;
            self.ivEight.hidden = NO;
            self.ivEight.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-2]];
            self.ivEight.frame = frameModel.ivEightFrame;
            self.ivNine.hidden = NO;
            self.ivNine.image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
            self.ivNine.frame = frameModel.ivNineFrame;
            break;
        }
        default:
            break;
    }
}

@end
