//
//  ChatModel.m
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "ChatModel.h"

@implementation ChatModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)chatModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
