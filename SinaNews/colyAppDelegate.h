//
//  colyAppDelegate.h
//  SinaNews
//
//  Created by coly on 13-6-14.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCategoryViewController.h"
#import "NewsViewController.h"
#import "ColySidePanelController.h"

@interface colyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


//所有视图的总控制器
@property (retain, nonatomic) ColySidePanelController *mainViewController;


@end
