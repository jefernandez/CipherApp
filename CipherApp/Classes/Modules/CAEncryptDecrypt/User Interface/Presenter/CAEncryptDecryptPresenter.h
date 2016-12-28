//
//  CAEncryptDecryptPresenter.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CAEncryptDecryptInteractorIO.h"
#import "CAEncryptDecryptWireframe.h"
#import "CAEncryptDecryptModuleInterface.h"


@protocol CAEncryptDecryptViewInterface;

@interface CAEncryptDecryptPresenter : NSObject <CAEncryptDecryptInteractorOutput, CAEncryptDecryptModuleInterface>

@property (nonatomic, strong) CAEncryptDecryptWireframe*             encryptDecryptWireframe;
@property (nonatomic, strong) id<CAEncryptDecryptInteractorInput>    encryptDecryptInteractor;
@property (nonatomic, strong) UIViewController<CAEncryptDecryptViewInterface> *userInterface;
@end
