//
//  NewsCategoryCell.m
//  SinaNews
//
//  Created by coly on 13-8-7.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCategoryCell.h"

@implementation NewsCategoryCell
@synthesize categoryName,categoryThumb;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      // Initialization code
      [self setFrame:self.bounds];
      
      //背景
      UIImage *backgrouondImage = [UIImage imageNamed:@"leftchannel_tablecell_bg_unselected@2x"];
      UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgrouondImage];
      self.backgroundView = backgroundView;
      
      //高亮背景
      UIImage *selectedBackgrouondImage = [UIImage imageNamed:@"leftchannel_tablecell_bg_Hilighted@2x"];
      UIImageView *selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBackgrouondImage];
      self.selectedBackgroundView = selectedBackgroundView;
      
      //分类图标
      UIImage *catThumb = [UIImage imageNamed:@"image@2x.png"];
      self.categoryThumb = [[UIImageView alloc] initWithImage:catThumb];
      self.categoryThumb.frame = CGRectMake(10, 12, 20, 20);
      [self.contentView addSubview:self.categoryThumb];
      
      //分类文字
      self.categoryName = [UILabel new];
      self.categoryName.frame = CGRectMake(40, 7, 60, 30);
      self.categoryName.text = @"头条";
      self.categoryName.textColor = [UIColor whiteColor];
      self.categoryName.backgroundColor = [UIColor clearColor];
      self.categoryName.font = [UIFont fontWithName:@"Helvetica" size:18];
      [self.contentView addSubview:self.categoryName];
      
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  
  if (selected)
  {
    
  }
  
  [super setSelected:selected animated:animated];
}


- (void)setHighlighted:(BOOL)highlighted
{
  if (highlighted)
  {
    
  }
  [super setHighlighted:highlighted];
}

/**
 *  @brief 设置cell的frame
 */
- (void)setFrame:(CGRect)frame
{
//  NSLog(@"%f",frame.size.width);
  frame.size.width -=20;
  frame.size.height -=5;
  [super setFrame:frame];
}

@end
