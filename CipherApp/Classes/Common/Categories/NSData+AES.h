//
//  NSData+AES.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 27/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

typedef NS_ENUM(NSInteger, AESSize) {
    AESSize128,
    AESSize256
};

@interface NSData (AES)

/**
 *  @brief Devuelve la cedena cifrada o descifrada en crudo.
 *
 *  @param operation (kCCEncrypt/kCCDecrypt).
 *  @param size longitud de la clave.
 *  @param key clave con la que cifrar la cadena.
 *  @return cadena cifrada o descifrada en crudo.
 */

- (NSData *)AESOperation:(CCOperation)operation size:(AESSize)size withKey:(NSString *)key;
@end
