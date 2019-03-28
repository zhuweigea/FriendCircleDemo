//
//  FriendCirecleFrameModel.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/29.
//  Copyright © 2019 朱伟阁. All rights reserved.
//
#define CONTENTMAXHEIGHT [UIFont systemFontOfSize:17].lineHeight*3
#import <Foundation/Foundation.h>
#import "ChatFrameModel.h"
@class FriendCircleModel;
NS_ASSUME_NONNULL_BEGIN

@interface FriendCirecleFrameModel : NSObject

@property(nonatomic, strong) FriendCircleModel *model;

@property(nonatomic, assign, readonly) CGRect iconFrame;
@property(nonatomic, assign, readonly) CGRect nameFrame;
@property(nonatomic, assign, readonly) CGRect contentFrame;
@property(nonatomic, assign, readonly) CGRect buttonFrame;
@property(nonatomic, assign, readonly) CGRect ivOneFrame;
@property(nonatomic, assign, readonly) CGRect ivTwoFrame;
@property(nonatomic, assign, readonly) CGRect ivThreeFrame;
@property(nonatomic, assign, readonly) CGRect ivFourFrame;
@property(nonatomic, assign, readonly) CGRect ivFiveFrame;
@property(nonatomic, assign, readonly) CGRect ivSixFrame;
@property(nonatomic, assign, readonly) CGRect ivSevenFrame;
@property(nonatomic, assign, readonly) CGRect ivEightFrame;
@property(nonatomic, assign, readonly) CGRect ivNineFrame;

@property(nonatomic, assign, readonly) CGFloat cellHeight;
//@property(nonatomic, assign, readonly) CGFloat headerViewHeight;

@end

NS_ASSUME_NONNULL_END
