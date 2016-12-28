//
//  CAEncryptDecrytWireframe.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CAEncryptDecryptModuleInterface.h"

@class CAEncryptDecryptPresenter;
@class CARootWireframe;

@interface CAEncryptDecryptWireframe : NSObject


@property (nonatomic, strong) CARootWireframe *rootWireframe;
@property (nonatomic, strong) CAEncryptDecryptPresenter *encryptDecryptPresenter;

- (void)presentCAEncryptDecryptInterfaceFromWindow:(UIWindow *)window;

@end
