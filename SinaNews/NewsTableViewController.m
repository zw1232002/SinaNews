//
//  NewsTableViewController.m
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsCell.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "NewsObject.h"
#import "NewsDetailViewController.h"
#import "Tools.h"



@class PullTableView;


@interface NewsTableViewController ()<UITableViewDataSource, UITableViewDelegate, PullTableViewDelegate>

//当前页数
@property (assign, nonatomic) int page;

//总记录数
@property (assign,nonatomic) int count;

//用来判断是不是首次打开，
@property (assign,nonatomic) Boolean isFirst;


@end

@implementation NewsTableViewController
@synthesize newsListArray,page,count,newsListTable,typeName;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
      self.typeName =@"";
      
      self.newsListTable = [[PullTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
      
      self.newsListTable.pullBackgroundColor = [UIColor clearColor];
      
      self.tableView = self.newsListTable;
      
      //竟然设置这个就行了，太坑了。。。。。
      self.newsListTable.pullDelegate = self;
      
      self.newsListTable.delegate = self;
      self.newsListTable.dataSource = self;
      
      //去除分割线
      self.newsListTable.separatorStyle = UITableViewCellSeparatorStyleNone;
      
      self.isFirst = YES;
      
     [self.view setBackgroundColor:[UIColor clearColor]];
      
    }
    return self;
}


- (void)viewDidLoad
{
  [super viewDidLoad];

  //初始化新闻数组
  self.newsListArray = [NSMutableArray new];
}



- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  //如果是首次打开就刷新，不然的话，每次载入视图都会刷新的
  if (self.isFirst == YES)
  {
    self.page = 1;
    
    if (self.newsListTable.pullTableIsRefreshing == NO)
    {
      self.newsListTable.pullTableIsRefreshing = YES;
      [self performSelector:@selector(refreshTable) withObject:nil afterDelay:1.0f];
    }
    self.isFirst = NO;
  }
  self.navigationItem.titleView=[Tools getTtileViewWithTitle:self.typeName andPositionOffset:110.f];
}

- (void)getResult
{
  NSString *url = [NSString stringWithString:requestURL(self.typeName, self.page, perPageNewsCount)];
  
  debugLog(@"%@",url);
  
  //因为url中有中文，这里进行一下url转义
  NSString *encodeURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
  NSURL *requestUrl = [NSURL URLWithString:encodeURL];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
  
  //添加接收的格式支持，不然html头的json会报错
  [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
  
  AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSURLResponse *response, id JSON)
  {
    if (JSON)
    {
      self.count = [[JSON objectForKey:@"total"] intValue];
      [self setData:[JSON objectForKey:@"item"]];

    }
                                         
  } failure:^(NSURLRequest *request, NSURLResponse *response, NSError *error, id jj)
  {
    
    [Tools tipWithText:@"亲，网络无连接，请检查网络设置！" andView:self.navigationController.view];
    self.newsListTable.pullTableIsLoadingMore = NO;
    self.newsListTable.pullTableIsRefreshing = NO;

    debugLog(@"\nThe http request error:%@",error);
  }];
  
  [operation start];
  
}

/**
 *  
 */
- (void)setData:(NSDictionary *)data
{
  for (NSDictionary *dict in data) {
    NewsObject *news = [[NewsObject alloc] initWithDictionary:dict];
    [self.newsListArray addObject:news];
  }
  
  [self.newsListTable reloadData];
  
  //在数据表重新加载之后，再把loading状态设置NO
  if (self.newsListTable.pullTableIsRefreshing == YES)
  {
    self.newsListTable.pullLastRefreshDate = [NSDate date];
  }
  self.newsListTable.pullTableIsLoadingMore = NO;
  self.newsListTable.pullTableIsRefreshing = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.newsListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NewsCellIdentifier = @"NewsCellIdentifier";
    NewsCell *cell = [self.newsListTable dequeueReusableCellWithIdentifier:NewsCellIdentifier];
    if (cell == nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NewsCellIdentifier];
    }
  

    // Configure the cell...
  
  NSInteger row = [indexPath row];
  
  //这里判断一下当前的news数组是不是已经加载进来了，如果不判断，会报错
  if (row <= [self.newsListArray count])
  {
    NewsObject *news = [self.newsListArray objectAtIndex:row];
    
    cell.newsTitle.text = news.title;
    cell.newsPublishDate.text = news.addTime;
    
    if (news.thumb)
    {
      [cell.newsThumb setImageWithURL:[NSURL URLWithString:news.thumb] placeholderImage:[UIImage imageNamed:@"cell_photo_default_small.png"]];
    }
  }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return newsCellHeight;
}




#pragma mark  - pullRefreshTable methods

/**
 *  @brief 刷新数据表
 *
 */
- (void)refreshTable
{
  self.page=1;
  [self.newsListArray removeAllObjects];
  [self getResult];
  
}


/**
 *  @brief 载入更多
 *
 */
- (void)loadMoreToTable
{
  //判断一下总页数，超出不再请求
  if (ceil(self.count/perPageNewsCount)< self.page)
  {
    [Tools tipWithText:@"没有更多数据了！" andView:self.navigationController.view];
    self.newsListTable.pullTableIsLoadingMore = NO;
    self.newsListTable.pullTableIsRefreshing = NO;
  }else
  {
    self.page++;
    [self getResult];
  }
}


#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
  [self performSelector:@selector(refreshTable) withObject:nil afterDelay:1.0f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
  [self performSelector:@selector(loadMoreToTable) withObject:nil afterDelay:1.0f];
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSUInteger row = [indexPath row];
  NewsObject *news = [self.newsListArray objectAtIndex:row];
  int newsId = news.id;
  NewsDetailViewController *newsDetail = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
  [newsDetail loadWebViewFromNewsId:newsId andSetViewTitle:news.title];
  [self.navigationController pushViewController:newsDetail animated:YES];
}

@end
