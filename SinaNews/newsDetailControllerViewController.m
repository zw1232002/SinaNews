//
//  newsDetailControllerViewController.m
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsDetailControllerViewController.h"
#import "newsDetailWebView.h"
#import "Tools.h"

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
      
      self.navigationItem.titleView = [[Tools new]getTtileViewWithTitle:@"新闻详细"];
      
      //开始自定义返回按钮
      UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
      
      backButton.frame = CGRectMake(0, 0, 15, 22);
      
      [backButton setBackgroundImage:[UIImage imageNamed:@"ic_back@2x.png"] forState:UIControlStateNormal];
      
      [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
      
      UIBarButtonItem *navLeftBarItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
      
      self.navigationItem.leftBarButtonItem = navLeftBarItem;
      

    }
    return self;
}

- (void)back
{
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadWebViewFromNewsId:(int)id andSetViewTitle:(NSString *)title
{
//  self.title = title;
  NSString *detailURL = [NSString stringWithString:newDetailURL(id)];
  newsDetailWebView *detaiView = [[newsDetailWebView alloc] initWithFrame:self.view.bounds];
  
  //设置这个很重要，不然uiwebview没法接收
  [detaiView setDelegate:self];
  [detaiView loadHTMLFromString:detailURL];
  [self.view addSubview:detaiView];
}

//当网页正在加载时，显示正在载入
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//  NSLog(@"\nwebview start loading");
  self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(-20, -30, 340, 510)];
  [self.loadingView setBackgroundColor:[UIColor whiteColor]];
  [self.view addSubview:self.loadingView];
  
  UILabel *loadingText = [UILabel new];
  loadingText.text = @"载入中...";
  loadingText.frame = CGRectMake((kDeviceWidth-80)/2 + 48, (kDeviceHeight -30)/2-15, 80, 30);
  [loadingText setBackgroundColor:[UIColor clearColor]];
  [self.loadingView addSubview:loadingText];
  
  self.activeView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 32.0f, 32.0f)];
  [self.activeView setCenter:self.loadingView.center];
  [self.activeView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
  [self.loadingView addSubview:self.activeView];
  

  [self.activeView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//  NSLog(@"\nwebview finish loading");
  [self.activeView stopAnimating];
  [self.loadingView removeFromSuperview];
  
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
  NSLog(@"didFailLoadWithError:%@", error);
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
