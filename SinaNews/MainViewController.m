//
//  MainViewController.m
//  SinaNews
//
//  Created by coly on 13-7-9.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize newsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  
  [self.view setBackgroundColor:[UIColor clearColor]];
  
  //引入新闻控制器
  self.newsController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
  [self.view addSubview:self.newsController.view];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
