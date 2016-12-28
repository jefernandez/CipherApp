//
//  CAEncryptDecryptPresenter.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "CAEncryptDecryptPresenter.h"
#import "CAEncryptDecryptViewInterface.h"
@implementation CAEncryptDecryptPresenter


- (void)encryptText:(NSString*)plainText withAESAlgorithm:(NSInteger)index andKey:(NSString*)key
{
    AESSize size;
    switch (index) {
        case 0:
            size = AESSize128;
            break;
        case 1:
            size = AESSize256;
            break;
        default:
            size = AESSize256;
            break;
    }
    [self.encryptDecryptInteractor encryptText:plainText withAESAlgorithm:size andKey:key];
}

- (void)decryptText:(NSString*)encryptedString withAESAlgorithm:(NSInteger)index andKey:(NSString *)key
{
    AESSize size;
    switch (index) {
        case 0:
            size = AESSize128;
            break;
        case 1:
            size = AESSize256;
            break;
        default:
            size = AESSize256;
            break;
    }
    [self.encryptDecryptInteractor decryptText:encryptedString withAESAlgorithm:size andKey:key];
}

- (void)encryptText:(NSString*)plainText withRSAAlgorithmAndKey:(NSString*)key
{
    [self.encryptDecryptInteractor encryptText:plainText withRSAAlgorithmAndKey:key];
}

- (void)decryptText:(NSString*)encryptedString withRSAAlgorithmAndKey:(NSString*)key
{
    [self.encryptDecryptInteractor decryptText:encryptedString withRSAAlgorithmAndKey:key];
}

#pragma mark - EncryptDecrypt Interactor Output

 -(void) encryptDone:(NSString*)encryptedString
{
    [self.userInterface setEncryptedString:encryptedString];
}
- (void)decryptDone:(NSString*)plainTextString
{
    [self.userInterface setDecryptedString:plainTextString];
}

@end
