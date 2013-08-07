//
//  NewsCategoryObject.h
//  SinaNews
//
//  Created by coly on 13-8-7.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsCategoryObject : NSObject

@property (strong, nonatomic) NSString *title;//标题
@property (strong, nonatomic) NSString *thumb;//图标

- (NewsCategoryObject *)initWithDictionary:(NSDictionary *)NewsCategory;
@end
