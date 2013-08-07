//
//  newsDetailWebView.m
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsDetailWebView.h"

@implementation NewsDetailWebView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.scalesPageToFit = YES;
      
    }
    return self;
}

- (void)loadHTMLFromString:(NSString *)stringURL
{
//  [self loadDocument:@"test.css"];
  NSURL *url = [NSURL URLWithString:stringURL];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self loadRequest:request];
}

//加载本地使用说明文件文件
-(void)loadDocument:(NSString *)docName
{
  NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
  NSString *path=[mainBundleDirectory stringByAppendingPathComponent:docName];
  
  NSURL *url=[NSURL fileURLWithPath:path];
  NSURLRequest *request=[NSURLRequest requestWithURL:url];
  [self loadRequest:request];
}

- (void)loadCss
{
  NSString *css =@"<style>body{padding:20px;background:#f00;}</style>";
  [self loadHTMLString:css baseURL:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
