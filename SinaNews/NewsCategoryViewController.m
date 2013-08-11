//
//  NewsCategoryViewController.m
//  SinaNews
//
//  Created by coly on 13-8-6.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCategoryViewController.h"
#import "NewsCategoryCell.h"
#import "NewsCategoryObject.h"
#import "ColySidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "NewsViewController.h"
#import "NewsTableViewController.h"

@interface NewsCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (retain,nonatomic) UITableView *categoryTable;

@end

@implementation NewsCategoryViewController
@synthesize categoryArray,categoryTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializatio
      self.categoryArray = [[NSMutableArray alloc] init];
      
      //开始初始化分类
      NSArray *catNameArray = [[NSArray alloc] initWithObjects:@"国内",@"国际",@"图片",@"社会",@"探索",@"军事",@"评论",nil];
      
      NSArray *catThumbArray = [[NSArray alloc] initWithObjects:@"toutiao@2x.png",@"yule@2x",@"tupian@2x",@"boke@2x",@"keji@2x",@"caijing@2x",@"tiyu@2x",nil];
      
      for (int i=0;i<[catNameArray count];i++)
      {
        NSDictionary *catDic = [NSDictionary dictionaryWithObjectsAndKeys:[catNameArray objectAtIndex:i],@"title",[catThumbArray objectAtIndex:i],@"thumb",nil];
        NewsCategoryObject *catObject = [[NewsCategoryObject alloc]initWithDictionary:catDic];
        [self.categoryArray addObject:catObject];
        catDic = nil;catObject = nil;
      }
      
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftchannel_bg@2x"]];
      
      //顶部背景
      UIImage *headImage = [UIImage imageNamed:@"leftchannel_head_bg@2x"];
      UIImageView *headImageView = [[UIImageView alloc] initWithImage:headImage];
      headImageView.frame = CGRectMake(0, 0, kDeviceWidth, 46);
      [self.view addSubview:headImageView];
      
      //顶部“新浪新闻”文字
      UILabel *sinaText = [UILabel new];
      sinaText.frame = CGRectMake(10, 8, 80, 30);
      sinaText.text = @"新浪新闻";
      sinaText.textColor = [UIColor whiteColor];
      sinaText.backgroundColor = [UIColor clearColor];
      sinaText.font = [UIFont fontWithName:@"Helvetica" size:18];
      [self.view addSubview:sinaText];
      
      //订阅
      UIButton *rssButton = [UIButton buttonWithType:UIButtonTypeCustom];
      rssButton.frame = CGRectMake(180, 13, 20, 20);
      [rssButton setBackgroundImage:[UIImage imageNamed:@"leftchannel_head_plus@2x"] forState:UIControlStateNormal];
      [self.view addSubview:rssButton];
      
      //新闻分类的tableview
      self.categoryTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 56, leftChanelWidth, kDeviceHeight) style:UITableViewStylePlain];
      self.categoryTable.backgroundColor = [UIColor clearColor];
      self.categoryTable.separatorStyle = UITableViewCellSeparatorStyleNone;
      self.categoryTable.delegate = self;
      self.categoryTable.dataSource = self;
      [self.view addSubview:self.categoryTable];
      
      
      
      
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.categoryArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return newsCategoryCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *newsCategoryIdenfifier = @"newsCategory";
  NewsCategoryCell *cell = [self.categoryTable dequeueReusableCellWithIdentifier:newsCategoryIdenfifier];
  if (cell == nil)
  {
    cell = [[NewsCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsCategoryIdenfifier];
  }
  
  //设置cell数据
  NSInteger row = [indexPath row];
  NewsCategoryObject *cat = [self.categoryArray objectAtIndex:row];
  cell.categoryName.text = cat.title;
  cell.categoryThumb.image = [UIImage imageNamed:cat.thumb];
  
  if ([cat.title isEqual: defaultTypeName])
  {
    //设置默认选中
    [self.categoryTable selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  NSInteger row = [indexPath row];
  NewsCategoryObject *cat = [self.categoryArray objectAtIndex:row];
  
  NewsTableViewController *table = [[NewsTableViewController alloc] initWithStyle:UITableViewStylePlain];
  
  //设置默认分类
  table.typeName = cat.title;
  
  self.sidePanelController.centerPanel = [[NewsViewController alloc] initWithRootViewController:table];
  
}





@end
