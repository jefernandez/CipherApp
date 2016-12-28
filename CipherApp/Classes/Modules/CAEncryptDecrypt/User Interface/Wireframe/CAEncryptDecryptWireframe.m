//
//  CAEncryptDecrytWireframe.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "CAEncryptDecryptWireframe.h"
#import "CAEncryptDecryptViewController.h"
#import "CAEncryptDecryptPresenter.h"
#import "CARootWireframe.h"

@interface CAEncryptDecryptWireframe ()
@property (nonatomic, strong) CAEncryptDecryptViewController *encryptDecryptViewController;
@end

@implementation CAEncryptDecryptWireframe
- (void)presentCAEncryptDecryptInterfaceFromWindow:(UIWindow *)window
{
    CAEncryptDecryptViewController *encryptDecryptViewController = [[CAEncryptDecryptViewController alloc] initWithNibName: @"CAEncryptDecryptViewController" bundle: nil];
    encryptDecryptViewController.eventHandler = self.encryptDecryptPresenter;
    self.encryptDecryptPresenter.userInterface = encryptDecryptViewController;
    self.encryptDecryptViewController = encryptDecryptViewController;
    
    [self.rootWireframe showRootViewController:encryptDecryptViewController
                                      inWindow:window];
}


@end
