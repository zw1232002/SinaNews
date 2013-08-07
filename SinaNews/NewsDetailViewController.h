//
//  NewsDetailViewController.h
//  SinaNews
//
//  Created by coly on 13-8-7.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController

- (void)loadWebViewFromNewsId:(int)id andSetViewTitle:(NSString *)title;
@end
