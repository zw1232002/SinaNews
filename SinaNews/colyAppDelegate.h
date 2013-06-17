//
//  colyAppDelegate.h
//  SinaNews
//
//  Created by coly on 13-6-14.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsViewController.h"

@interface colyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//新闻视图控制器
@property (retain, nonatomic) NewsViewController *newsController;

@end
