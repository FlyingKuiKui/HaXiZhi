//
//  NSString+Algorithm.h
//  HaXiZhi
//
//  Created by 王盛魁 on 16/7/14.
//  Copyright © 2016年 WangShengKui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Algorithm)

+ (NSString *)sha1:(NSString *)inputString;
+ (NSString *)filesha1:(NSString *)pathString;

+ (NSString *)md5:(NSString *)inputString;
+ (NSString *)fileMD5:(NSString *)pathString;

@end
