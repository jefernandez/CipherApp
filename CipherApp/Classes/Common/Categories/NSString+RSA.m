//
//  NSString+RSA.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "NSString+RSA.h"
#import "NSData+RSA.h"

@implementation NSString (RSA)

- (NSString *)encryptStringWithpublicKey:(NSString *)pubKey{
    NSData *data = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptDataWithPublicKey:pubKey];
    return  [[NSString alloc] initWithData:[data base64EncodedDataWithOptions:0] encoding:NSUTF8StringEncoding];

}


- (NSString *)decryptStringWithPrivateKey:(NSString *)privKey{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    data = [data decryptDataWithPrivateKey:privKey];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
}

@end
