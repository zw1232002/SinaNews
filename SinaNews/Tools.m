//
//  Tools.m
//  SinaNews
//
//  Created by coly on 13-7-29.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "Tools.h"

@implementation Tools


- (UIView *)getTtileViewWithTitle:(NSString *)title
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,44)];
  [view setBackgroundColor:[UIColor clearColor]];
  [view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ];
  
  UILabel *nameLabel = [[UILabel alloc] init];
  [nameLabel setFrame:CGRectMake(0, 0, 320, 44)];
  [nameLabel setBackgroundColor:[UIColor clearColor]];
  [nameLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin];
  [nameLabel setTextColor:lightGreyColor];
  [nameLabel setFont:[UIFont boldSystemFontOfSize:19]];
  [nameLabel setTextAlignment:UITextAlignmentCenter];
  [nameLabel setText:title];
  [view addSubview:nameLabel];
  return view;
}



@end


