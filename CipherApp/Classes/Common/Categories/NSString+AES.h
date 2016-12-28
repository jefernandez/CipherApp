//
//  NSString+AES.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 27/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES.h"
@interface NSString (AES)

/**
 *  @brief Devuelve la cedena cifrada en base64.
 *
 *  @param size longitud de la clave.
 *  @param key clave con la que cifrar la cadena.
 *  @return cadena cifrada en base64.
 */
- (NSString *)AESSize:(AESSize)size EncryptWithKey:(NSString *)key;

/**
 *  @brief Devuelve la cedena descifrada.
 *
 *  @param size longitud de la clave.
 *  @param key clave con la que descifrar la cadena.
 *  @return cadena descifrada.
 */
- (NSString *)AESSize:(AESSize)size DecryptWithKey:(NSString *)key;

@end
