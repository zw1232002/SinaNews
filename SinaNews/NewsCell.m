//
//  NewsCell.m
//  SinaNews
//
//  Created by coly on 13-6-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
@synthesize newsThumb,newsTitle,newsAbstract,newsPublishDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      // Initialization code
      //设置背景
      self.frame = CGRectMake(20, 0, 320, 88);
      
      
      UIImage *centerImage = [UIImage imageNamed:@"bg_card@2x.png"];
      UIImageView *centerImageView = [[UIImageView alloc] initWithImage:centerImage];
      [self.contentView addSubview:centerImageView];
      
      
      //缩略图
      self.newsThumb = [UIImageView new];
      self.newsThumb.frame = CGRectMake(11 ,11, 65, 65);
      self.newsThumb.image = [UIImage imageNamed:@"cell_photo_default_small.png"];
      [self.contentView addSubview:self.newsThumb];
      
      //新闻标题
      self.newsTitle = [UILabel new];
      self.newsTitle.frame = CGRectMake(85, 14, 222, 19);
      self.newsTitle.text = @"同志们神十明晚过境肉眼可察察到";
      self.newsTitle.textColor = [UIColor colorWithRed:34.0f/255.0f green:34.0f/255.0f  blue:34.0f/255.0f  alpha:1.0f];
      self.newsTitle.lineBreakMode = NSLineBreakByTruncatingTail;
      //超过14个字符就截取
      self.newsTitle.text = [self.newsTitle.text length] <= 13 ? self.newsTitle.text : [self.newsTitle.text substringToIndex:13];
      self.newsTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      self.newsTitle.backgroundColor = [UIColor clearColor];
      [self.contentView addSubview:self.newsTitle];
      
      //新闻简介
      self.newsAbstract = [UILabel new];
      self.newsAbstract.frame = CGRectMake(85, 40, 220, 35);
      self.newsAbstract.numberOfLines = 0;
      self.newsAbstract.text = @"北京天文馆朱金表示，神十将在明晚7时左右过境北京，天文爱好者可以观看。";
      self.newsAbstract.font = [UIFont fontWithName:@"Arial" size:12];
      self.newsAbstract.textColor = [UIColor grayColor];
      self.newsAbstract.text = [self.newsAbstract.text substringToIndex:26];
      self.newsAbstract.text = [NSString stringWithFormat:@"%@ .....",self.newsAbstract.text];
      self.newsAbstract.backgroundColor = [UIColor clearColor];
      [self.contentView addSubview:self.newsAbstract];
      
      //发表时间
      self.newsPublishDate = [UILabel new];
      self.newsPublishDate.frame = CGRectMake(239, 58, 120, 14);
      self.newsPublishDate.font = [UIFont fontWithName:@"Arial" size:10];
      self.newsPublishDate.textColor = [UIColor grayColor];
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
      [dateFormatter setDateFormat:@"MM-dd HH:mm"];
      self.newsPublishDate.text = [dateFormatter stringFromDate:[NSDate date]];
      self.newsPublishDate.backgroundColor = [UIColor clearColor];
      [self.contentView addSubview:self.newsPublishDate];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
