//
//  FriendCircleModel.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/27.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendCircleModel : NSObject

@property(nonatomic, copy) NSString *iconStr;
@property(nonatomic, copy) NSString *nameStr;
@property(nonatomic, copy) NSString *contentStr;
@property(nonatomic, assign) BOOL allOrPart;
@property(nonatomic, strong) NSArray<NSString *> *imageArr;

@end

NS_ASSUME_NONNULL_END
