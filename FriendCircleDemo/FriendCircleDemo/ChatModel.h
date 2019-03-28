//
//  ChatModel.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    MESSAGEME,
    MESSAGEOTHER
} MESSAGETYPE;

NS_ASSUME_NONNULL_BEGIN

@interface ChatModel : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, assign) MESSAGETYPE type;
@property(nonatomic, assign) BOOL showTime;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)chatModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
