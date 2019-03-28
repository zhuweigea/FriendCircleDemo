//
//  FriendCirecleFrameModel.m
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/29.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendCirecleFrameModel.h"
#import "FriendCircleModel.h"

@implementation FriendCirecleFrameModel

- (void)setModel:(FriendCircleModel *)model{
    _model = model;
    CGFloat iconX = HORSPACING;
    CGFloat iconY = VERSPACING;
    _iconFrame = CGRectMake(iconX, iconY, IMAGEVIEWWIDTH, IMAGEVIEWHEIGHT);
    CGFloat nameLabelX = HORSPACING*2+IMAGEVIEWWIDTH;
    CGFloat nameLabelY = VERSPACING;
    CGFloat nameLabelH = [UIFont systemFontOfSize:14].lineHeight;
    CGFloat nameLabelW = SCREENWIDTH-HORSPACING*3-IMAGEVIEWWIDTH;
    _nameFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    CGFloat contentLabelX = CGRectGetMinX(_nameFrame);
    CGFloat contentLabelY = VERSPACING + CGRectGetMaxY(_nameFrame);
    CGSize contentSize = [model.contentStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(_nameFrame), 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    CGFloat contentLabelW = contentSize.width;
    CGFloat contentLabelH = contentSize.height;
    if (contentLabelH > CONTENTMAXHEIGHT) {
        if (!model.allOrPart) {
            contentLabelH = CONTENTMAXHEIGHT;
            _contentFrame = CGRectMake(contentLabelX, contentLabelY, contentLabelW, contentLabelH);
        }else{
            _contentFrame = CGRectMake(contentLabelX, contentLabelY, contentLabelW, contentLabelH);
        }
        CGFloat buttonX = CGRectGetMinX(_nameFrame);
        CGFloat buttonY = CGRectGetMaxY(_contentFrame) + VERSPACING;
        CGFloat buttonW = 50;
        CGFloat buttonH = 30;
        _buttonFrame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
        CGFloat buttonMaxY = CGRectGetMaxY(_buttonFrame);
        if (iconMaxY > buttonMaxY) {
            switch (model.imageArr.count) {
                case 1:{
                    UIImage *image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
                        CGFloat imageX = CGRectGetMinX(_nameFrame);
                        CGFloat imageY = iconMaxY + VERSPACING;
                        CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                        image = [image imageCompressForWidthScale:image targetWidth:imageW];
                        CGFloat imageH = image.size.height;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 2:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 3:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 4:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 5:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 6:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 7:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 8:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 9:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _ivNineFrame = CGRectMake(CGRectGetMinX(_ivSixFrame),CGRectGetMaxY(_ivSixFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                default:
                    break;
            }
        }else{
            switch (model.imageArr.count) {
                case 1:{
                    UIImage *image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    image = [image imageCompressForWidthScale:image targetWidth:imageW];
                    CGFloat imageH = image.size.height;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 2:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 3:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 4:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 5:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 6:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 7:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 8:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 9:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = buttonMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _ivNineFrame = CGRectMake(CGRectGetMinX(_ivSixFrame),CGRectGetMaxY(_ivSixFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                default:
                    break;
            }
        }
    }else{
        _contentFrame = CGRectMake(contentLabelX, contentLabelY, contentLabelW, contentLabelH);
        _buttonFrame = CGRectZero;
        CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
        CGFloat contentMaxY = CGRectGetMaxY(_contentFrame);
        if (iconMaxY > contentMaxY) {
            switch (model.imageArr.count) {
                case 1:{
                    UIImage *image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    image = [image imageCompressForWidthScale:image targetWidth:imageW];
                    CGFloat imageH = image.size.height;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 2:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 3:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 4:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 5:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 6:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 7:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 8:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 9:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = iconMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _ivNineFrame = CGRectMake(CGRectGetMinX(_ivSixFrame),CGRectGetMaxY(_ivSixFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                default:
                    break;
            }
        }else{
            switch (model.imageArr.count) {
                case 1:{
                    UIImage *image = [UIImage imageNamed:model.imageArr[model.imageArr.count-1]];
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    image = [image imageCompressForWidthScale:image targetWidth:imageW];
                    CGFloat imageH = image.size.height;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 2:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 3:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivOneFrame) +VERSPACING;
                    break;
                }
                case 4:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 5:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                   _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 6:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivFourFrame) +VERSPACING;
                    break;
                }
                case 7:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 8:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                case 9:{
                    CGFloat imageX = CGRectGetMinX(_nameFrame);
                    CGFloat imageY = contentMaxY + VERSPACING;
                    CGFloat imageW = (CGRectGetWidth(_nameFrame)-HORSPACING*2)*1/3;
                    CGFloat imageH = imageW;
                    _ivOneFrame = CGRectMake(imageX, imageY, imageW, imageH);
                    _ivTwoFrame = CGRectMake(CGRectGetMaxX(_ivOneFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivThreeFrame = CGRectMake(CGRectGetMaxX(_ivTwoFrame)+HORSPACING, imageY, imageW, imageH);
                    _ivFourFrame = CGRectMake(CGRectGetMinX(_ivOneFrame),CGRectGetMaxY(_ivOneFrame)+VERSPACING, imageW, imageH);
                    _ivFiveFrame = CGRectMake(CGRectGetMinX(_ivTwoFrame),CGRectGetMaxY(_ivTwoFrame)+VERSPACING, imageW, imageH);
                    _ivSixFrame = CGRectMake(CGRectGetMinX(_ivThreeFrame),CGRectGetMaxY(_ivThreeFrame)+VERSPACING, imageW, imageH);
                    _ivSevenFrame = CGRectMake(CGRectGetMinX(_ivFourFrame),CGRectGetMaxY(_ivFourFrame)+VERSPACING, imageW, imageH);
                    _ivEightFrame = CGRectMake(CGRectGetMinX(_ivFiveFrame),CGRectGetMaxY(_ivFiveFrame)+VERSPACING, imageW, imageH);
                    _ivNineFrame = CGRectMake(CGRectGetMinX(_ivSixFrame),CGRectGetMaxY(_ivSixFrame)+VERSPACING, imageW, imageH);
                    _cellHeight = CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    //_headerViewHeight= CGRectGetMaxY(_ivSevenFrame) +VERSPACING;
                    break;
                }
                default:
                    break;
            }
        }
    }
}

@end
