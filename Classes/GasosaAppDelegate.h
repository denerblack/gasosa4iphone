//
//  GasosaAppDelegate.h
//  Gasosa
//
//  Created by Dener Wilian Pereira do Carmo on 28/03/11.
//  Copyright 2011 Agence. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GasosaViewController;

@interface GasosaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GasosaViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GasosaViewController *viewController;

@end

