//
//  NSData+RSA.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (RSA)

/**
 *  @brief Devuelve la cedena cifrada con RSA 1024.
 *
 *  @param pubKey clave publica con la que cifrar la cadena.Si es nil se generan las claves internamente
 *  @return cadena cifrada.
 */
- (NSData *)encryptDataWithPublicKey:(NSString *)pubKey;

/**
 *  @brief Devuelve la cedena descifrada.
 *
 *  @param privKey clave privada con la que descifrar la cadena.Si es nil se generan las claves internamente
 *  @return cadena descifrada.
 */
- (NSData *)decryptDataWithPrivateKey:(NSString *)privKey;
@end
