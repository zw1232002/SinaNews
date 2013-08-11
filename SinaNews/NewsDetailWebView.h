//
//  newsDetailWebView.h
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailWebView : UIWebView

//加载网页
- (void)loadHTMLFromString:(NSString *)stringURL;

@end
