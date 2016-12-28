//
//  SharedKeyPair.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedKeyPair : NSObject


+ (instancetype)keypair;


/**
 *  @brief Devuelve la referencia a la clave publica.
 *
 *  @return referencia a la clave publica.
 */
- (SecKeyRef)getPublicKeyRef;

/**
 *  @brief Devuelve la referencia a la clave privada.
 *
 *  @return referencia a la clave privada.
 */
- (SecKeyRef)getPrivateKeyRef;
@end
