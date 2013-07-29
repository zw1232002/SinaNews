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
      
      UIImage *naviBarBackground = [UIImage imageNamed:@"toolbar_bg@2x"];
      
      UIImage *navSizeImage = [self compressImage:naviBarBackground bySpecifiedWidth:320 andHeight:44];
      
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

- (UIView *)getTtileViewWithTitle:(NSString *)title
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,44)];
  [view setBackgroundColor:[UIColor redColor]];
//  [view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ];
  
  UILabel *nameLabel = [[UILabel alloc] init];
  [nameLabel setFrame:CGRectMake(0, 0, 320, 44)];
  [nameLabel setBackgroundColor:[UIColor redColor]];
//  [nameLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin];
  [nameLabel setTextColor:[UIColor blackColor]];
//  [nameLabel setFont:[UIFont boldSystemFontOfSize:17]];
//  [nameLabel setTextAlignment:UITextAlignmentCenter];
  [nameLabel setText:title];
  [view addSubview:nameLabel];
  return view;
}



@end
