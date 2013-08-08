//
//  Tools.m
//  SinaNews
//
//  Created by coly on 13-7-29.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "Tools.h"
#import "MBProgressHUD.h"

@implementation Tools


- (UIView *)getTtileViewWithTitle:(NSString *)title andPositionOffset:(CGFloat )offset
{
  UILabel *nameLabel = [[UILabel alloc] init];
  //这里注意了，不要把width设置成屏幕的宽度，这样会导致无法自适应居中
  //随便设置一个值，系统都会自己居中的
  CGRect frame = CGRectMake(0, 0, kDeviceWidth, 44);
  frame.size.width -=offset;
  [nameLabel setFrame:frame];
  [nameLabel setBackgroundColor:[UIColor clearColor]];
  [nameLabel setTextColor:lightGreyColor];
  [nameLabel setFont:[UIFont boldSystemFontOfSize:19]];
  [nameLabel setTextAlignment:NSTextAlignmentCenter];
  [nameLabel setText:title];
  return nameLabel;
}


- (void)tipWithText:(NSString *)text andView:(UIView *)view
{
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  hud.mode = MBProgressHUDModeText;
  hud.labelText = text;
  hud.margin = 15.f;
  hud.yOffset = 20.f;
  hud.removeFromSuperViewOnHide = YES;
  [hud hide:YES afterDelay:2];
}


@end


