//
//  CAEncryptDecryptModuleInterface.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES.h"

@protocol CAEncryptDecryptModuleInterface <NSObject>

/**
 *  @brief cipher the plainText String with AES Algorithm.
 *
 *  @param plainText String to encryt.
 *  @param index (0->AES128/1->AES256).
 *  @param key Key to encrypt.
 */
- (void)encryptText:(NSString*)plainText withAESAlgorithm:(NSInteger)index andKey:(NSString*)key;

/**
 *  @brief decipher the plainText String with AES Algorithm.
 *
 *  @param encryptedString String to decryt.
 *  @param index (0->AES128/1->AES256).
 *  @param key Key to decrypt.
 */
- (void)decryptText:(NSString*)encryptedString withAESAlgorithm:(NSInteger)index andKey:(NSString *)key;

/**
 *  @brief cipher the plainText String with RSA Algorithm.
 *
 *  @param plainText String to encryt.
 *  @param key Key to encrypt.
 */
- (void)encryptText:(NSString*)plainText withRSAAlgorithmAndKey:(NSString*)key;

/**
 *  @brief decipher the plainText String with RSA Algorithm.
 *
 *  @param encryptedString String to encryt.
 *  @param key Key to encrypt.
 */
- (void)decryptText:(NSString*)encryptedString withRSAAlgorithmAndKey:(NSString*)key;

@end
