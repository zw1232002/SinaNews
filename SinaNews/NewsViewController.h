//
//  NewsViewController.h
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTableViewController.h"

@interface NewsViewController : UIViewController

//新闻导航控制器
@property (retain, nonatomic) UINavigationController *NewsNavigation;

//新闻列表控制器
@property (retain ,nonatomic) NewsTableViewController *newsList;

@end
