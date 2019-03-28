//
//  ChatFrameModel.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//
#define VERSPACING 5
#define HORSPACING 10
#define IMAGEVIEWWIDTH 40
#define IMAGEVIEWHEIGHT 40
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@class ChatModel;
NS_ASSUME_NONNULL_BEGIN

@interface ChatFrameModel : NSObject

@property(nonatomic, strong) ChatModel *messageModel;
@property(nonatomic, assign, readonly) CGRect timeLabelFrame;
@property(nonatomic, assign, readonly) CGRect iconImageViewFrame;
@property(nonatomic, assign, readonly) CGRect textButtonFrame;
@property(nonatomic, assign, readonly) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
