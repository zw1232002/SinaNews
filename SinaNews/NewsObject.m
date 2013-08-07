//
//  newsObject.m
//  SinaNews
//
//  Created by coly on 13-7-18.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "newsObject.h"

@implementation NewsObject
@synthesize id,thumb,title,addTime;


- (NewsObject *)initWithDictionary:(NSDictionary *)news
{
  self.id = [[news objectForKey:@"id"] intValue];
  self.title = [news objectForKey:@"title"];
  self.thumb = [news objectForKey:@"thumb"];
  self.addTime = [news objectForKey:@"addtime"];
  return self;
}


@end
