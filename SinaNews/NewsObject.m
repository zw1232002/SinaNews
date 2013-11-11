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

  NSDate * date = [NSDate date];
  NSTimeInterval sec = [date timeIntervalSinceNow];
  NSDate * currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:sec];
  
  //设置时间输出格式：
  NSDateFormatter * df = [[NSDateFormatter alloc] init ];
  [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  NSString * na = [df stringFromDate:currentDate];
  NSString *getData = [news objectForKey:@"addtime"];
  //如果时间为空，则使用当前时间
  self.addTime = getData == [NSNull null] ? na : getData;
  return self;
}


@end
