//
//  NewsViewController.m
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize NewsNavigation,newsList;


- (id)initWithTypeName:(NSString *)typeName
{
  if (self) {
    // Custom initialization
    [self.view setBackgroundColor:cccColor];
    
    self.newsList = [[NewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    //设置默认分类
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

/**
 *  @brief 显示左视图
 *
 */
- (void)showLeftChanel
{
  NSLog(@"%@",[self.sidePanelController class]);
  [self.sidePanelController showLeftPanelAnimated:YES];
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

/**
 * @brief 创建制定长度和宽度的图片
 */
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
