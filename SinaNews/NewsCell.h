//
//  NewsCell.h
//  SinaNews
//
//  Created by coly on 13-6-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

//新闻缩略图
@property (retain, nonatomic) UIImageView *newsThumb;

//新闻标题
@property (retain, nonatomic) UILabel *newsTitle;

//新闻简介
@property (retain, nonatomic) UILabel *newsAbstract;

//新闻发表时间
@property (retain, nonatomic) UILabel *newsPublishDate;

@end
