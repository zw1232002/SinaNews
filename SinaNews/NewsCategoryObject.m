//
//  NewsCategoryObject.m
//  SinaNews
//
//  Created by coly on 13-8-7.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "NewsCategoryObject.h"

@implementation NewsCategoryObject

@synthesize thumb,title;


- (NewsCategoryObject *)initWithDictionary:(NSDictionary *)NewsCategory
{
  self.title = [NewsCategory objectForKey:@"title"];
  self.thumb = [NewsCategory objectForKey:@"thumb"];
  return self;
}
@end
