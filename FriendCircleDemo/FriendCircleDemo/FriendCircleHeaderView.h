//
//  FriendCirecleHeaderView.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/30.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendCircleModel;
@class FriendCirecleFrameModel;
@class FriendCircleHeaderView;
NS_ASSUME_NONNULL_BEGIN

@protocol FriendCircleHeaderViewDelegate <NSObject>

- (void)refreshTableView:(FriendCircleHeaderView *)headerview;

@end

@interface FriendCircleHeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong) UIImageView *iconIV;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *contentLbl;
@property(nonatomic, strong) UIButton *hideBtn;
@property(nonatomic, strong) UIImageView *ivOne;
@property(nonatomic, strong) UIImageView *ivTwo;
@property(nonatomic, strong) UIImageView *ivThree;
@property(nonatomic, strong) UIImageView *ivFour;
@property(nonatomic, strong) UIImageView *ivFive;
@property(nonatomic, strong) UIImageView *ivSix;
@property(nonatomic, strong) UIImageView *ivSeven;
@property(nonatomic, strong) UIImageView *ivEight;
@property(nonatomic, strong) UIImageView *ivNine;

@property(nonatomic, strong) FriendCircleModel *friendCircleModel;
@property(nonatomic, strong) FriendCirecleFrameModel *frameModel;
//@property(nonatomic, weak) id<FriendCircleCellDelegate> delegate;
@property(nonatomic, weak) id<FriendCircleHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
