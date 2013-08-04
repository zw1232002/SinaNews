//
//  NewsCell.m
//  SinaNews
//
//  Created by coly on 13-6-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCell.h"
#import "MBProgressHUD.h"

@interface NewsCell()

//单元格背景
@property (strong,nonatomic) UIImageView *centerImageView;

@end


@implementation NewsCell
@synthesize newsThumb,newsTitle,newsPublishDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      // Initialization code
      
      //设置背景
      
      UIImage *centerImage = [UIImage imageNamed:@"cell_bg@2x.png"];
      //拉伸图片背景，原来如此
      centerImage=[centerImage stretchableImageWithLeftCapWidth:15 topCapHeight:9];
      
      self.centerImageView = [[UIImageView alloc] initWithImage:centerImage];
      self.centerImageView.frame = CGRectMake(-5, 0, 330, 88);
      [self.contentView addSubview:self.centerImageView];
      
      
//      UIImage *centerImage2 = [UIImage imageNamed:@"cell_bg_hl@2x.png"];
//      //拉伸图片背景，原来如此
//      centerImage2=[centerImage2 stretchableImageWithLeftCapWidth:15 topCapHeight:9];
//      
//      UIImageView *imageView2 = [[UIImageView alloc] initWithImage:centerImage2];
//      imageView2.frame = CGRectMake(-5, 0, 330, 88);
////      [self.contentView addSubview:self.centerImageView];
//      self.selectedBackgroundView = imageView2;
      
      
      //缩略图
      self.newsThumb = [UIImageView new];
      self.newsThumb.frame = CGRectMake(13 ,11, 65, 65);
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
    if (highlighted)
    {
      

    }else
    {
      
      
    }
}

@end
