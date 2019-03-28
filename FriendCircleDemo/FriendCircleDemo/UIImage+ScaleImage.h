//
//  UIImage+ScaleImage.h
//  核心动画
//
//  Created by 朱伟阁 on 2019/1/30.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ScaleImage)
//指定宽度按比例缩放
-(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

@end

NS_ASSUME_NONNULL_END
