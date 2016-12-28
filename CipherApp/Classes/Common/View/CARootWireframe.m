//
//  CARootWireframe.m
//  CipherApp
//
//  Created by Jesús Emilio Fernández de Frutos on 28/12/2016.
//  Copyright © 2016 Jesús Emilio Fernández de Frutos. All rights reserved.
//

#import "CARootWireframe.h"

@implementation CARootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    window.rootViewController = viewController;
    [window makeKeyAndVisible];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}
@end
