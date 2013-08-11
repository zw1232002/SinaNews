//
//  CheckNetWork.m
//  SinaNews
//
//  Created by coly on 13-8-11.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "CheckNetWork.h"
#import "Reachability.h"

@implementation CheckNetWork


-(void)CheckNetworkStatus
{
  debugLog(@"开启 www.baidu.com 的网络检测");
  //开启网络状况的监听
  
  [[NSNotificationCenter defaultCenter] addObserver:self
   
                                           selector:@selector(reachabilityChanged:)
   
                                               name: kReachabilityChangedNotification
   
                                             object: nil];
  
  Reachability *hostReach = [Reachability reachabilityWithHostName: @"www.apple.com"];
	[hostReach startNotifier];
	[self updateInterfaceWithReachability: hostReach];
}

// 连接改变

- (void) reachabilityChanged: (NSNotification* )note

{
  
  Reachability* curReach = [note object];
  
  NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
  
  [self updateInterfaceWithReachability: curReach];
  
}


//处理连接改变后的情况

- (void) updateInterfaceWithReachability: (Reachability*) curReach

{
  //对连接改变做出响应的处理动作。
  
  NetworkStatus netStatus = [curReach currentReachabilityStatus];
  
  debugLog(@"%@",netStatus);
  
  
  switch (netStatus)
  {
    case NotReachable://没有连接到网络就弹出提实况
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"新浪新闻" message:@"亲，网络连接失败，请检查网络设置！"delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
      [alert show];
      return;
      break;
    }
      
    case ReachableViaWWAN://2G或者3G网络
    {
      
      break;
    }
    case ReachableViaWiFi://Wifi
    {
      
      break;
    }
  }
}

static CheckNetWork * instance = nil;
+(CheckNetWork *) Instance
{
  @synchronized(self)
  {
    if(nil == instance)
    {
      [self new];
    }
  }
  return instance;
}


@end