//
//  NSStringAESTests.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+AES.h"

@interface NSStringAESTests : XCTestCase
@property (nonatomic, strong) NSString *plainText;
@property (nonatomic, strong) NSString *key;
@end

@implementation NSStringAESTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.plainText  = @"plain text to be ciphered";
    self.key  = @"key2Cipher";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEncrypt {


    NSString *encryptedString = [self.plainText AESSize:AESSize128 EncryptWithKey:self.key];
    
    XCTAssertTrue([encryptedString isEqualToString:@"Nbt4hDd5+taA7uvp9bcq4nZfOKbyjtk8uAsAXAL3ZDI="],
                  @"Error ciphering with AES128");
    
    encryptedString = [self.plainText AESSize:AESSize256 EncryptWithKey:self.key];
    XCTAssertTrue([encryptedString isEqualToString:@"JLjBDzI0thgDMSUyhzXbVmF+M5uDsAEMmguS4v2xmE0="],
                  @"Error ciphering with AES256");
}

- (void)testDecrypt {
    
    
    NSString *plainString = [@"Nbt4hDd5+taA7uvp9bcq4nZfOKbyjtk8uAsAXAL3ZDI=" AESSize:AESSize128 DecryptWithKey:self.key];
    
    XCTAssertTrue([plainString isEqualToString:@"plain text to be ciphered"],
                  @"Error desciphering with AES128");
    
    plainString = [@"JLjBDzI0thgDMSUyhzXbVmF+M5uDsAEMmguS4v2xmE0=" AESSize:AESSize256 DecryptWithKey:self.key];
    XCTAssertTrue([plainString isEqualToString:@"plain text to be ciphered"],
                  @"Error desciphering with AES256");
}



- (void)testFull {
    
    
    NSString *plainString = [[self.plainText AESSize:AESSize128 EncryptWithKey:self.key] AESSize:AESSize128 DecryptWithKey:self.key];
    
    XCTAssertTrue([plainString isEqualToString:@"plain text to be ciphered"],
                  @"Error ciphering/desciphering with AES128");
    
    plainString = [[self.plainText AESSize:AESSize256 EncryptWithKey:self.key] AESSize:AESSize256 DecryptWithKey:self.key];
    XCTAssertTrue([plainString isEqualToString:@"plain text to be ciphered"],
                  @"Error ciphering/desciphering with AES256");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
