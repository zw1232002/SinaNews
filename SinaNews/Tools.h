//
//  Tools.h
//  SinaNews
//
//  Created by coly on 13-7-29.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Tools : NSObject

/**
 * @brief 用UILabel充当导航控制器的标题，获取标题view
 */
- (UIView *)getTtileViewWithTitle:(NSString *)title;

//弹出提示框
- (void)tipWithText:(NSString *)text andView:(UIView *)view;

@end
