//
//  WP7ScrollAppDelegate.h
//  WP7Scroll
//
//  Created by 李伟 on 12-4-11.
//  Copyright 2012年 LiWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WP7ScrollViewController;

@interface WP7ScrollAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet WP7ScrollViewController *viewController;

@end
