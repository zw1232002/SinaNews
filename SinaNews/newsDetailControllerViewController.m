//
//  newsDetailControllerViewController.m
//  SinaNews
//
//  Created by coly on 13-7-19.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsDetailControllerViewController.h"
#import "newsDetailWebView.h"

@interface newsDetailControllerViewController ()

@end

@implementation newsDetailControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      UILabel *loadingText = [UILabel new];
      loadingText.frame = CGRectMake(100, 40, self.view.bounds.size.width, self.view.bounds.size.height);
      loadingText.text = @"正在加载....";
      [self.view addSubview:loadingText];

    }
    return self;
}

- (void)loadWebViewFromNewsId:(int)id
{
  NSString *detailURL = [NSString stringWithString:newDetailURL(id)];
  newsDetailWebView *detaiView = [[newsDetailWebView alloc] initWithFrame:self.view.bounds];
  [detaiView loadHTMLFromString:detailURL];
  [self.view addSubview:detaiView];
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
