//
//  NewsViewController.m
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsViewController.h"
#import "ColySidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "Tools.h"

@implementation NewsViewController


- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  self.view.backgroundColor = cccColor;
  
  UIImage *naviBarBackground = [UIImage imageNamed:@"toolbar_bg@2x"];
  
  UIImage *navSizeImage = [Tools compressImage:naviBarBackground bySpecifiedWidth:kDeviceWidth andHeight:44];
  
  [self.navigationBar setBackgroundImage:navSizeImage forBarMetrics:UIBarMetricsDefault];
  
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
