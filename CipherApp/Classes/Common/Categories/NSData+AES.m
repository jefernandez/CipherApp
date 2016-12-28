//
//  NSData+AES.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 27/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "NSData+AES.h"

@implementation NSData (AES)
- (NSData *)AESOperation:(CCOperation)operation size:(AESSize)size withKey:(NSString *)key
{
    
    size_t keysize;
    
    switch (size) {
        case AESSize128:
            keysize = kCCKeySizeAES128;
            break;
            
        case AESSize256:
            keysize = kCCKeySizeAES256;
            break;
            
        default:
            keysize = kCCKeySizeAES128;
            break;
    }
    
    char keyPtr[keysize + 1];
    bzero( keyPtr, sizeof( keyPtr ) );
    
    [key getCString:keyPtr maxLength:sizeof( keyPtr ) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc( bufferSize );
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt( operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, keysize,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted );
    if( cryptStatus == kCCSuccess )
    {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    return nil;
}


@end
