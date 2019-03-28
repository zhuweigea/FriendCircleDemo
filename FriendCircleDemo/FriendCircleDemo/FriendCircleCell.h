//
//  FriendCircleCell.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/27.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#define VERTICAL_SPACING 10
#define HORIZONTAL_SPACING 20
#define MAX_HEIGHT [UIFont systemFontOfSize:16].lineHeight*3
#define LINE_HEIGHT [UIFont systemFontOfSize:16].lineHeight
#define SMALL_IMAGE_HEIGHT 150
#define BIG_IMAGE_HEIGHT 60
static const CGFloat icon_height = 40;
static const CGFloat icon_width = 40;

#import <UIKit/UIKit.h>
@class FriendCircleModel;
@class FriendCirecleFrameModel;
@class FriendCircleCell;
NS_ASSUME_NONNULL_BEGIN

@protocol FriendCircleCellDelegate <NSObject>

- (void)refreshTableView:(FriendCircleCell *)cell;

@end

@interface FriendCircleCell : UITableViewCell

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
@property(nonatomic, weak) id<FriendCircleCellDelegate> delegate;

@property(nonatomic, assign) CGRect oldFrame;

@end

NS_ASSUME_NONNULL_END
