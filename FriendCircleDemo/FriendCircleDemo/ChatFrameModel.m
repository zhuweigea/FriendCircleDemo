//
//  ChatFrameModel.m
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatFrameModel.h"
#import "ChatModel.h"

@implementation ChatFrameModel

- (void)setMessageModel:(ChatModel *)messageModel{
    _messageModel = messageModel;
    if (messageModel.showTime) {
        _timeLabelFrame = CGRectZero;
    }else{
        CGFloat timeLabelH = [UIFont systemFontOfSize:14].lineHeight;
        CGFloat timeLabelX = 0;
        CGFloat timeLabelY = VERSPACING;
        CGFloat timeLabelW =SCREENWIDTH;
        _timeLabelFrame = CGRectMake(timeLabelX, timeLabelY, timeLabelW, timeLabelH);
    }
    CGFloat iconImageViewY = CGRectGetHeight(_timeLabelFrame) + VERSPACING;
    CGFloat textBtnMaxW = 200;
    CGSize textSize = [messageModel.text boundingRectWithSize:CGSizeMake(textBtnMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    //增加按钮的大小
    CGFloat textW = textSize.width + 30;
    CGFloat textH = textSize.height + 20;
    if (messageModel.type == MESSAGEME) {
        CGFloat iconImageViewX = SCREENWIDTH - HORSPACING - IMAGEVIEWWIDTH;
        _iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, IMAGEVIEWWIDTH, IMAGEVIEWHEIGHT);
        CGFloat textX = SCREENWIDTH - HORSPACING - IMAGEVIEWWIDTH - textW;
        CGFloat textY = iconImageViewY;
        _textButtonFrame = CGRectMake(textX, textY, textW, textH);
    }else{
        CGFloat iconImageViewX = HORSPACING;
        _iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, IMAGEVIEWWIDTH, IMAGEVIEWHEIGHT);
        CGFloat textX = HORSPACING + IMAGEVIEWWIDTH;
        CGFloat textY = iconImageViewY;
        _textButtonFrame = CGRectMake(textX, textY, textW, textH);
        
    }
    CGFloat IMAGEVIEWY = CGRectGetMaxY(_iconImageViewFrame);
    CGFloat BTNY = CGRectGetMaxY(_textButtonFrame);
    if(BTNY > IMAGEVIEWY){
        _cellHeight = BTNY + VERSPACING;
    }else{
        _cellHeight = IMAGEVIEWY + VERSPACING;
    }
}

@end
