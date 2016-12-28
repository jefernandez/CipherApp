//
//  CAEncryptDecryptInteractor.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAEncryptDecryptInteractorIO.h"

@interface CAEncryptDecryptInteractor : NSObject <CAEncryptDecryptInteractorInput>
@property (nonatomic, weak)     id<CAEncryptDecryptInteractorOutput> output;
@end
