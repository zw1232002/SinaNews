//
//  Tools.h
//  SinaNews
//
//  Created by coly on 13-7-29.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @brief 工具类，全部是静态方法
 */
@interface Tools : NSObject

/**
 * @brief 用UILabel充当导航控制器的标题，获取标题view
 */
+(UIView *)getTtileViewWithTitle:(NSString *)title andPositionOffset:(CGFloat)offset;

//弹出提示框
+(void)tipWithText:(NSString *)text andView:(UIView *)view;

/**
 * @brief 创建制定长度和宽度的图片
 */
+(UIImage *)compressImage:(UIImage *)imgSrc bySpecifiedWidth:(int)width andHeight:(int)height;
@end
