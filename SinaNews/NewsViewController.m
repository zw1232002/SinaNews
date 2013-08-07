//
//  NewsViewController.m
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize NewsNavigation,newsList;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      [self.view setBackgroundColor:cccColor];
      
      self.newsList = [[NewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
      
      self.NewsNavigation = [[UINavigationController alloc] initWithRootViewController:self.newsList];
      
      [self.view setFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
      
      UIImage *naviBarBackground = [UIImage imageNamed:@"toolbar_bg@2x"];
      
      UIImage *navSizeImage = [self compressImage:naviBarBackground bySpecifiedWidth:kDeviceWidth andHeight:44];
      
      [self.NewsNavigation.navigationBar setBackgroundImage:navSizeImage forBarMetrics:UIBarMetricsDefault];
      
      //左侧按钮
//      UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//      
//      backButton.frame = CGRectMake(0, 0, 44, 44);
//      
//      [backButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_left_menu_icon@2x.png"] forState:UIControlStateNormal];
//      
//      [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//      
//      UIBarButtonItem *navLeftBarItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
//      
//      self.NewsNavigation.navigationItem.leftBarButtonItem = navLeftBarItem;
//      self.navigationItem.leftBarButtonItem = navLeftBarItem;
      
      [self.view addSubview:self.NewsNavigation.view];
      
    }
    return self;
}

- (id)initWithTypeName:(NSString *)typeName
{
  if (self) {
    // Custom initialization
    [self.view setBackgroundColor:cccColor];
    
    self.newsList = [[NewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.newsList.typeName = typeName;
    
    self.NewsNavigation = [[UINavigationController alloc] initWithRootViewController:self.newsList];
    
    [self.view setFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    
    UIImage *naviBarBackground = [UIImage imageNamed:@"toolbar_bg@2x"];
    
    UIImage *navSizeImage = [self compressImage:naviBarBackground bySpecifiedWidth:kDeviceWidth andHeight:44];
    
    [self.NewsNavigation.navigationBar setBackgroundImage:navSizeImage forBarMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:self.NewsNavigation.view];
    
  }
  return self;
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
                                    
- (UIImage *)compressImage:(UIImage *)imgSrc bySpecifiedWidth:(int)width andHeight:(int)height
{
        CGSize size = {width, height};
        UIGraphicsBeginImageContext(size);
        CGRect rect = {{0,0}, size};
        [imgSrc drawInRect:rect];
        UIImage *compressedImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return compressedImg;
}




@end
