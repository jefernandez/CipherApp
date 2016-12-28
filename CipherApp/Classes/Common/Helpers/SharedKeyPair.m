//
//  SharedKeyPair.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "SharedKeyPair.h"

static const UInt8 publicKeyIdentifier[] = "com.jeff.CipherApp.publickey";
static const UInt8 privateKeyIdentifier[] = "com.jeff.CipherApp.privatekey";

@interface SharedKeyPair()
{
    SecKeyRef publicKey;
    SecKeyRef privateKey;
    NSData *publicTag;
    NSData *privateTag;
}
@end

@implementation SharedKeyPair

+ (instancetype)keypair {
    static SharedKeyPair *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
    if (self = [super init])
    {
        privateTag = [[NSData alloc] initWithBytes:privateKeyIdentifier length:sizeof(privateKeyIdentifier)];
        publicTag = [[NSData alloc] initWithBytes:publicKeyIdentifier length:sizeof(publicKeyIdentifier)];
    }
    return self;
}

-(SecKeyRef)getPublicKeyRef {
    
    OSStatus sanityCheck = noErr;
    SecKeyRef publicKeyReference = NULL;
    
    if (publicKeyReference == NULL) {
        [self generateKeyPair:512];
        NSMutableDictionary *queryPublicKey = [[NSMutableDictionary alloc] init];
        
        [queryPublicKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClass];
        [queryPublicKey setObject:publicTag forKey:(__bridge id)kSecAttrApplicationTag];
        [queryPublicKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
        [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
        
        
        sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)queryPublicKey, (CFTypeRef *)&publicKeyReference);
        
        
        if (sanityCheck != noErr)
        {
            publicKeyReference = NULL;
        }
        
        
    } else { publicKeyReference = publicKey; }
    
    return publicKeyReference;
}

- (void)generateKeyPair:(NSUInteger)keySize {
    OSStatus sanityCheck = noErr;
    publicKey = NULL;
    privateKey = NULL;

    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * keyPairAttr = [[NSMutableDictionary alloc] init];
    
    [keyPairAttr setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [keyPairAttr setObject:[NSNumber numberWithUnsignedInteger:keySize] forKey:(__bridge id)kSecAttrKeySizeInBits];
    

    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [privateKeyAttr setObject:privateTag forKey:(__bridge id)kSecAttrApplicationTag];
    

    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [publicKeyAttr setObject:publicTag forKey:(__bridge id)kSecAttrApplicationTag];
    

    [keyPairAttr setObject:privateKeyAttr forKey:(__bridge id)kSecPrivateKeyAttrs];
    [keyPairAttr setObject:publicKeyAttr forKey:(__bridge id)kSecPublicKeyAttrs];
    

    sanityCheck = SecKeyGeneratePair((__bridge CFDictionaryRef)keyPairAttr, &publicKey, &privateKey);

    if(sanityCheck == noErr  && publicKey != NULL && privateKey != NULL)
    {
        NSLog(@"Successful");
    }

}

- (SecKeyRef)getPrivateKeyRef {
    OSStatus resultCode = noErr;
    SecKeyRef privateKeyReference = NULL;

    [self generateKeyPair:512];
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClass];
    [queryPrivateKey setObject:privateTag forKey:(__bridge id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
    
    resultCode = SecItemCopyMatching((__bridge CFDictionaryRef)queryPrivateKey, (CFTypeRef *)&privateKeyReference);
    
    if(resultCode != noErr)
    {
        privateKeyReference = NULL;
    }
    
    return privateKeyReference;
}



@end
