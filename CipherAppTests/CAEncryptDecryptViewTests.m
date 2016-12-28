//
//  CAEncryptDecryptViewTests.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CAEncryptDecryptViewController.h"

@interface CAEncryptDecryptViewTests : XCTestCase
@property (nonatomic, strong)   CAEncryptDecryptViewController*  view;
@end

@implementation CAEncryptDecryptViewTests

- (void)setUp {
    [super setUp];
    
    self.view = [[CAEncryptDecryptViewController alloc] initWithNibName: @"CAEncryptDecryptViewController" bundle: nil];
    [self.view loadView];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetEncrypt {

    NSString *text = @"JLjBDzI0thgDMSUyhzXbVmF+M5uDsAEMmguS4v2xmE0=";
    [self.view setEncryptedString:text];
    XCTAssertTrue([text isEqualToString:self.view.encryptedTextView.text],
                  @"Error in setEncryptedString");

}

- (void)testSetDecrypt {
    
    NSString *text = @"plain text to be ciphered";
    [self.view setDecryptedString:text];
    XCTAssertTrue([text isEqualToString:self.view.decryptedTextView.text],
                  @"Error in setDecryptedString");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
