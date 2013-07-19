//
//  newsDetailWebView.m
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsDetailWebView.h"

@implementation newsDetailWebView

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
  NSURL *url = [NSURL URLWithString:stringURL];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self loadRequest:request];
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
