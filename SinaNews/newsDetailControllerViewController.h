//
//  newsDetailControllerViewController.h
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newsDetailControllerViewController : UIViewController


- (void)loadWebViewFromNewsId:(int)id andSetViewTitle:(NSString *)title;
@end
