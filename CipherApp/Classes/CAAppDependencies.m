//
//  CAAppDependencies.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "CAAppDependencies.h"
#import "CAEncryptDecryptWireframe.h"
#import "CARootWireframe.h"
#import "CAEncryptDecryptPresenter.h"
#import "CAEncryptDecryptInteractor.h"

@interface CAAppDependencies ()

@property (nonatomic, strong) CAEncryptDecryptWireframe *encDecWireframe;

@end

@implementation CAAppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}


- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.encDecWireframe presentCAEncryptDecryptInterfaceFromWindow:window];
}


- (void)configureDependencies
{
    // Root Level Classes
    
    CARootWireframe *rootWireframe = [[CARootWireframe alloc] init];
    
    // EncryptDecrypt Modules Classes
    CAEncryptDecryptWireframe *encryptDecryptWireframe = [[CAEncryptDecryptWireframe alloc] init];
    CAEncryptDecryptPresenter *encryptDecryptPresenter = [[CAEncryptDecryptPresenter alloc] init];
    CAEncryptDecryptInteractor *encryptDecryptInteractor = [[CAEncryptDecryptInteractor alloc] init] ;
    
    // EncryptDecrypt Module Classes
    encryptDecryptInteractor.output = encryptDecryptPresenter;
    
    encryptDecryptPresenter.encryptDecryptInteractor = encryptDecryptInteractor;
    encryptDecryptPresenter.encryptDecryptWireframe = encryptDecryptWireframe;
    
    encryptDecryptWireframe.encryptDecryptPresenter = encryptDecryptPresenter;
    encryptDecryptWireframe.rootWireframe = rootWireframe;
    self.encDecWireframe = encryptDecryptWireframe;
}


@end
