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
      [self.view setBackgroundColor:[UIColor clearColor]];
      self.newsList = [[NewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
      
      self.NewsNavigation = [[UINavigationController alloc] initWithRootViewController:self.newsList];
      
      
      
//      [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"banner_back.png"] forBarMetrics:UIBarMetricsDefault];
      
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

@end
