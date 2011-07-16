//
//  CSSSampleAppDelegate.h
//  CSSSample
//
//  Created by Jonathan Dalrymple on 16/07/2011.
//  Copyright 2011 Float:Right Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSSSampleViewController;

@interface CSSSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CSSSampleViewController *viewController;

@end
