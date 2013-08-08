//
//  NewsCategoryCell.m
//  SinaNews
//
//  Created by coly on 13-8-7.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCategoryCell.h"

@interface NewsCategoryCell()

@property (strong, nonatomic) UIImageView *defaultBackView;

@property (strong, nonatomic) UIImageView *hightedBackView;

@end

@implementation NewsCategoryCell
@synthesize categoryName,categoryThumb;
@synthesize defaultBackView,highlighted;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      // Initialization code
      [self setFrame:self.bounds];
      
      //背景
      UIImage *backgrouondImage = [UIImage imageNamed:@"leftchannel_tablecell_bg_unselected@2x"];
      self.defaultBackView = [[UIImageView alloc] initWithImage:backgrouondImage];
      self.backgroundView = self.defaultBackView;
      
      //高亮背景
      self.hightedBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftchannel_tablecell_bg_Hilighted@2x"]];
      
      //选中背景
      UIImage *selectedBackgrouondImage = [UIImage imageNamed:@"leftchannel_tablecell_bg_selected@2x"];
      UIImageView *selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBackgrouondImage];
      self.selectedBackgroundView = selectedBackgroundView;
      
      //分类图标
      self.categoryThumb = [UIImageView new];
      self.categoryThumb.image = [UIImage imageNamed:@"toutiao@2x"];
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

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
  if ( highlighted)
  {
    self.backgroundView = self.hightedBackView;
    
  }else
  {
    self.backgroundView = self.defaultBackView;
  }
  
  //这个不能调用，调用了会使用selectedBackgroundView的背景作为高亮背景
//  [super setHighlighted:highlighted animated:animated];
}

/**
 *  @brief 设置cell的frame
 */
- (void)setFrame:(CGRect)frame
{
  frame.size.width -=20;
  frame.size.height -=5;
  [super setFrame:frame];
}

@end
