//
//  CAEncryptDecryptInteractorTests.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CAEncryptDecryptInteractor.h"
#import "CAEncryptDecryptPresenter.h"
@interface CAEncryptDecryptInteractorTests : XCTestCase
@property (nonatomic, strong)  CAEncryptDecryptInteractor*  interactor;
@property (nonatomic, strong)  CAEncryptDecryptPresenter *encryptDecryptPresenter;
@end

@implementation CAEncryptDecryptInteractorTests

- (void)setUp {
    [super setUp];
    self.interactor = [[CAEncryptDecryptInteractor alloc] init];
    self.encryptDecryptPresenter = [[CAEncryptDecryptPresenter alloc] init];
    self.interactor.output = self.encryptDecryptPresenter;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEncryptTextWithAES {
    [self.interactor encryptText:@"plain text to be ciphered" withAESAlgorithm:AESSize128 andKey:@"key2Cipher"];
}

- (void)testEncryptTextWithRSA {
    [self.interactor encryptText:@"plain text to be ciphered" withRSAAlgorithmAndKey:nil];
}

- (void)testDecryptTextWithAES {
    [self.interactor decryptText:@"Nbt4hDd5+taA7uvp9bcq4nZfOKbyjtk8uAsAXAL3ZDI=" withAESAlgorithm:AESSize128 andKey:@"key2Cipher"];
}

- (void)testDecryptTextWithRSA {
    [self.interactor decryptText:@"Gf50A+aqkecLbcnkQsD5xmwZlFRfiFaA9MZDS7hEScaonw+LQJv22HAJFoGvScmlgGUot4YVDXFb4+AfOz5hew==" withRSAAlgorithmAndKey:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
