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




@end
