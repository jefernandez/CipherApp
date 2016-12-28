//
//  CAEncryptDecryptInteractor.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "CAEncryptDecryptInteractor.h"
#import "NSString+AES.h"
#import "NSString+RSA.h"
@implementation CAEncryptDecryptInteractor


- (void)encryptText:(NSString*)plainText withAESAlgorithm:(AESSize)size andKey:(NSString *)key
{
    NSString* encryptedText = [plainText AESSize:size EncryptWithKey:key];
    [self.output encryptDone:encryptedText];
}

- (void)decryptText:(NSString*)encryptedString withAESAlgorithm:(AESSize)size andKey:(NSString *)key
{
    NSString* plainText = [encryptedString AESSize:size DecryptWithKey:key];
    [self.output decryptDone:plainText];
}


- (void)encryptText:(NSString*)plainText withRSAAlgorithmAndKey:(NSString *)key
{
    NSString* encryptedText = [plainText encryptStringWithpublicKey:key];
    [self.output encryptDone:encryptedText];
}

- (void)decryptText:(NSString*)encryptedString withRSAAlgorithmAndKey:(NSString *)key
{
    NSString* plainText = [encryptedString decryptStringWithPrivateKey:key];
    [self.output decryptDone:plainText];
}



@end
