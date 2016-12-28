//
//  AppDelegate.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 27/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "AppDelegate.h"
#import "CAAppDependencies.h"
@interface AppDelegate ()
@property (nonatomic, strong) CAAppDependencies *dependencies;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CAAppDependencies *dependencies = [[CAAppDependencies alloc] init];
    self.dependencies = dependencies;
    
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;

}




@end
