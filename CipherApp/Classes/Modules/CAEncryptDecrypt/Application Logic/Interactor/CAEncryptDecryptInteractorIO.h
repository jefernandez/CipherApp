//
//  CAEncryptDecryptInteractorIO.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES.h"

@protocol CAEncryptDecryptInteractorInput <NSObject>
- (void)encryptText:(NSString*)plainText withAESAlgorithm:(AESSize)size andKey:(NSString *)key;
- (void)decryptText:(NSString*)encryptedString withAESAlgorithm:(AESSize)size andKey:(NSString *)key;
- (void)encryptText:(NSString*)plainText withRSAAlgorithmAndKey:(NSString *)key;
- (void)decryptText:(NSString*)encryptedString withRSAAlgorithmAndKey:(NSString *)key;
@end


@protocol CAEncryptDecryptInteractorOutput <NSObject>

- (void)encryptDone:(NSString*)encryptedString;
- (void)decryptDone:(NSString*)plainTextString;
@end
