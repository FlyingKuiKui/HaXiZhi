//
//  NSString+Algorithm.m
//  HaXiZhi
//
//  Created by 王盛魁 on 16/7/14.
//  Copyright © 2016年 WangShengKui. All rights reserved.
//

#import "NSString+Algorithm.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Algorithm)

#pragma mark - sha1 哈希算法
+ (NSString *)sha1:(NSString *)inputString{
    NSData *data = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes,(unsigned int)data.length,digest);
    NSMutableString *outputString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [outputString appendFormat:@"%02x",digest[i]];
    }
    return [outputString lowercaseString];
}
+ (NSString *)filesha1:(NSString *)pathString{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:pathString];
    if(!handle){
        return @"获取文件失败";
    }
    CC_SHA1_CTX sha1;
    CC_SHA1_Init(&sha1);
    
    BOOL done = NO;
    while(!done)
    {
        NSData *fileData = [handle readDataOfLength: 1024 ];
        CC_SHA1_Update(&sha1, [fileData bytes], (unsigned int)[fileData length]);
        if( [fileData length] == 0 ){
            done = YES;
        }
    }
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(digest, &sha1);
    [handle closeFile];
    NSMutableString *outputString = [NSMutableString string];
    for (int i = 0; i< CC_SHA1_DIGEST_LENGTH; i++) {
        [outputString appendFormat:@"%02x",digest[i]];
    }
    return [outputString lowercaseString];
}
#pragma mark - md5 算法
+ (NSString *)md5:(NSString *)inputString{
    const char *cStr = [inputString UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+ (NSString *)fileMD5:(NSString *)pathString{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:pathString];
    if(!handle){
        return @"获取文件失败";
    }
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 1024 ];
        CC_MD5_Update(&md5, [fileData bytes], (unsigned int)[fileData length]);
        if( [fileData length] == 0 ){
            done = YES;
        }
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    [handle closeFile];
    NSMutableString *StrMutable = [NSMutableString string];
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [StrMutable appendFormat:@"%02x",digest[i]];
    }
    return [StrMutable lowercaseString];
}
@end
