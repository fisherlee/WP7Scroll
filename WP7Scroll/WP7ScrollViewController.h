//
//  WP7ScrollViewController.h
//  WP7Scroll
//
//  Created by 李伟 on 12-4-11.
//  Copyright 2012年 LiWei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Scroll_View_Frame(Y)   CGRectMake(0, Y, 320, self.view.frame.size.height)
#define Sign_View_Frame(Y)     CGRectMake(0, Y, 320, 216+40)
#define View_Y   -(216+40)

@interface WP7ScrollViewController : UIViewController<UITextFieldDelegate> 
{
    UIImageView *bgImageView;
    UISwipeGestureRecognizer *_gestureRecognizerDirectionUp;
    UISwipeGestureRecognizer *_gestureRecognizerDirectionDown;
    
    UIView  *signView;
    UITextField *pwTextField;
    UILabel *timeLabel;
    UILabel *middayLabel;
    
    NSTimer *ttimer;
}

@property(nonatomic, retain)    UISwipeGestureRecognizer *gestureRecognizerDirectionUp;
@property(nonatomic, retain)    UISwipeGestureRecognizer *gestureRecognizerDirectionDown;


@end
