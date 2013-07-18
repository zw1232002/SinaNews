//
//  newsObject.m
//  SinaNews
//
//  Created by coly on 13-7-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsObject.h"

@implementation newsObject
@synthesize thumb,title,addTime;


- (newsObject *)initData:(NSDictionary *)news
{
  self.title = [news objectForKey:@"title"];
  self.thumb = [news objectForKey:@"thumb"];
  self.addTime = [news objectForKey:@"addTime"];
  return self;
}


@end
