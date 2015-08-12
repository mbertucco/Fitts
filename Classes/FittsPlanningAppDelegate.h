//
//  FittsPlanningAppDelegate.h
//  FittsPlanning
//
//  Created by Matteo Bertucco on 11/17/10.
//  Copyright 2010 University of Southern California. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FittsPlanningViewController;

@interface FittsPlanningAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FittsPlanningViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FittsPlanningViewController *viewController;

@end

