//
//  CheckNetWork.h
//  SinaNews
//
//  Created by coly on 13-8-11.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CheckNetWork : NSObject

-(void)CheckNetworkStatus;

//返回该类的实例，确保单例模式
+(CheckNetWork *) Instance;

@end
