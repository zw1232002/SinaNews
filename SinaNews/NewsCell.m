//
//  NewsCell.m
//  SinaNews
//
//  Created by coly on 13-6-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell()

//单元格背景
@property (strong,nonatomic) UIImageView *centerImageView;

@end


@implementation NewsCell
@synthesize newsThumb,newsTitle,newsAbstract,newsPublishDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      // Initialization code
      
      //设置背景
      self.backgroundColor = [UIColor clearColor];

//      self.contentView.backgroundColor = [UIColor whiteColor];
      
      UIImage *centerImage = [UIImage imageNamed:@"bg_card@2x.png"];
      self.centerImageView = [[UIImageView alloc] initWithImage:centerImage];
      self.centerImageView.frame = CGRectMake(7, 0, 306, 88);
      [self.contentView addSubview:self.centerImageView];
      
      
      //缩略图
      self.newsThumb = [UIImageView new];
      self.newsThumb.frame = CGRectMake(18 ,11, 65, 65);
      self.newsThumb.image = [UIImage imageNamed:@"cell_photo_default_small.png"];
      [self.contentView addSubview:self.newsThumb];
      
      //新闻标题
      self.newsTitle = [UILabel new];
      self.newsTitle.frame = CGRectMake(92, 14, 210, 45);
      self.newsTitle.numberOfLines = 0;
      self.newsTitle.text = @"北京天文馆朱金表示，神十将在明晚7时左右过境北京，天文爱好者可以观看";
      self.newsTitle.textColor = lightGreyColor;
      self.newsTitle.lineBreakMode = NSLineBreakByWordWrapping;
      self.newsTitle.text = [self.newsTitle.text substringToIndex:21];
      self.newsTitle.text = [NSString stringWithFormat:@"%@ .....",self.newsTitle.text];
      self.newsTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      self.newsTitle.backgroundColor = [UIColor clearColor];
      [self.contentView addSubview:self.newsTitle];
      
      //新闻简介
//      self.newsAbstract = [UILabel new];
//      self.newsAbstract.frame = CGRectMake(92, 40, 210, 35);
//      self.newsAbstract.numberOfLines = 0;
//      self.newsAbstract.text = @"北京天文馆朱金表示，神十将在明晚7时左右过境北京，天文爱好者可以观看。";
//      self.newsAbstract.font = [UIFont fontWithName:@"Arial" size:12];
//      self.newsAbstract.textColor = [UIColor grayColor];
//      self.newsAbstract.text = [self.newsAbstract.text substringToIndex:21];
//      self.newsAbstract.text = [NSString stringWithFormat:@"%@ .....",self.newsAbstract.text];
//      self.newsAbstract.backgroundColor = [UIColor clearColor];
//      [self.contentView addSubview:self.newsAbstract];
      
      //发表时间
      self.newsPublishDate = [UILabel new];
      self.newsPublishDate.frame = CGRectMake(205, 62, 120, 14);
      self.newsPublishDate.font = [UIFont fontWithName:@"Arial" size:10];
      self.newsPublishDate.textColor = [UIColor grayColor];
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
      [dateFormatter setDateFormat:@"YY-MM-dd HH:mm"];
      self.newsPublishDate.text = [dateFormatter stringFromDate:[NSDate date]];
      self.newsPublishDate.backgroundColor = [UIColor clearColor];
      [self.contentView addSubview:self.newsPublishDate];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  
  
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
//    if (highlighted)
//    {
//      self.contentView.backgroundColor = [UIColor redColor];
//
//    }else
//    {
//      self.contentView.backgroundColor = [UIColor whiteColor];
//    }
}

@end
