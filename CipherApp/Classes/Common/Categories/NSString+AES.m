//
//  NSString+AES.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 27/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "NSString+AES.h"


@implementation NSString (AES)

- (NSString *)AESSize:(AESSize)size EncryptWithKey:(NSString *)key
{
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [plainData AESOperation:kCCEncrypt
                                               size:size
                                            withKey:key];
    
    NSData *base64Data = [encryptedData base64EncodedDataWithOptions:0];
    return [[NSString alloc] initWithData:base64Data
                                 encoding:NSUTF8StringEncoding];
}


- (NSString *)AESSize:(AESSize)size DecryptWithKey:(NSString *)key
{
    NSData *encryptedData = [[NSData alloc]
                             initWithBase64EncodedString:self options:0];;
    NSData *plainData = [encryptedData AESOperation:kCCDecrypt
                                               size:size
                                            withKey:key];
    
    return [[NSString alloc] initWithData:plainData
                                 encoding:NSUTF8StringEncoding];
    
}

@end
