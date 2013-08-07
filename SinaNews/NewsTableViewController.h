//
//  NewsTableViewController.h
//  SinaNews
//
//  Created by coly on 13-6-17.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"

@interface NewsTableViewController : UITableViewController

//新闻列表table
@property (retain, nonatomic) PullTableView *newsListTable;

//保存新闻实体类的数组
@property (strong, nonatomic) NSMutableArray *newsListArray;

//分类名称
@property (strong, nonatomic) NSString *typeName;

@end
