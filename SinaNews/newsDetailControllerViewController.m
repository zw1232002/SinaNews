//
//  newsDetailControllerViewController.m
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsDetailControllerViewController.h"
#import "newsDetailWebView.h"

@interface newsDetailControllerViewController ()< UIWebViewDelegate>

@property (strong, nonatomic) UIView *loadingView;
@property (strong, nonatomic) UIActivityIndicatorView *activeView;

@end

@implementation newsDetailControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      self.title = @"新闻详细";
      
//      UILabel *loadingText = [UILabel new];
//      loadingText.frame = CGRectMake(100, 40, self.view.bounds.size.width, self.view.bounds.size.height);
//      loadingText.text = @"正在加载....";
//      [self.view addSubview:loadingText];

    }
    return self;
}

- (void)loadWebViewFromNewsId:(int)id andSetViewTitle:(NSString *)title
{
  self.title = title;
  NSString *detailURL = [NSString stringWithString:newDetailURL(id)];
  newsDetailWebView *detaiView = [[newsDetailWebView alloc] initWithFrame:self.view.bounds];
  [detaiView loadHTMLFromString:detailURL];
  [self.view addSubview:detaiView];
}

//当网页正在加载时，显示正在载入
- (void)webViewDidStartLoad:(UIWebView *)webView
{
  self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  [self.view addSubview:self.loadingView];
  
  self.activeView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 32.0f, 32.0f)];
  [self.activeView setCenter:self.loadingView.center];
  [self.activeView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
  [self.loadingView addSubview:self.activeView];
  
  [self.activeView startAnimating];
  NSLog(@"\nwebview start loading");
  
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
  [self.activeView stopAnimating];
  [self.loadingView removeFromSuperview];
  NSLog(@"\nwebview finish loading");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
