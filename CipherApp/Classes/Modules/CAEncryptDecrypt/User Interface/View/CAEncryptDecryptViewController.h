//
//  CAEncryptDecryptViewController.h
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAEncryptDecryptModuleInterface.h"
#import "CAEncryptDecryptViewInterface.h"

@interface CAEncryptDecryptViewController : UIViewController <CAEncryptDecryptViewInterface>
@property (nonatomic, strong) id<CAEncryptDecryptModuleInterface>    eventHandler;

@property (weak, nonatomic) IBOutlet UITextView *encryptedTextView;
@property (weak, nonatomic) IBOutlet UITextView *decryptedTextView;
@end
