//
//  WP7ScrollViewController.m
//  WP7Scroll
//
//  Created by 李伟 on 12-4-11.
//  Copyright 2012年 LiWei. All rights reserved.
//

#import "WP7ScrollViewController.h"
#import "RootViewController.h"

@implementation WP7ScrollViewController

@synthesize gestureRecognizerDirectionUp = _gestureRecognizerDirectionUp;
@synthesize gestureRecognizerDirectionDown = _gestureRecognizerDirectionDown;

- (void)dealloc
{
    [super dealloc];
    [_gestureRecognizerDirectionUp release];
    [_gestureRecognizerDirectionDown release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    //swipe
    _gestureRecognizerDirectionUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpControl)];
    _gestureRecognizerDirectionUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:_gestureRecognizerDirectionUp];

    _gestureRecognizerDirectionDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownControl)];
    _gestureRecognizerDirectionDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dgg.jpg"]];
    bgImageView.frame = Scroll_View_Frame(0);
    [self.view addSubview:bgImageView];
    [bgImageView release];
    
    //sign
    signView = [[UIView alloc] initWithFrame:Sign_View_Frame(bgImageView.frame.size.height)];
    signView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:signView];
    [signView release];
    
    pwTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    pwTextField.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    pwTextField.delegate = self;
    pwTextField.textAlignment = UITextAlignmentCenter;
    pwTextField.font = [UIFont systemFontOfSize:30];
    pwTextField.textColor = [UIColor whiteColor];
    pwTextField.secureTextEntry = YES;
    pwTextField.clearsOnBeginEditing = YES;
    pwTextField.adjustsFontSizeToFitWidth = YES;
    pwTextField.returnKeyType = UIReturnKeyGo;
    pwTextField.clearButtonMode = UITextFieldViewModeAlways;
    pwTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    pwTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [signView addSubview:pwTextField];
    [pwTextField release];
    
    //calendar
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSInteger unit = NSYearCalendarUnit | NSQuarterCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    components = [calendar components:unit fromDate:now];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    
    NSInteger weekday = [components weekday];
    
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    NSString *dateStr = [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
    NSString *weekDayStr = [NSString stringWithFormat:@"%d",weekday];
    NSString *timeStr = [NSString stringWithFormat:@"%d:%d",hour,minute];
    
    NSLog(@"%@ \n %@ \n %@",dateStr, weekDayStr, timeStr);
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.backgroundColor = [UIColor grayColor];
    bgView.alpha = 0.2;
    [bgImageView addSubview:bgView];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(bgImageView.frame.size.width-200, 40, 200, 40)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.text = dateStr;
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:36];
    [bgImageView addSubview:dateLabel];
    [dateLabel release];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, bgImageView.frame.size.height-160, 280, 60)];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.numberOfLines = 2;
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = [UIFont boldSystemFontOfSize:40];
    [bgImageView addSubview:timeLabel];
    [timeLabel release];
    
    middayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, bgImageView.frame.size.height-100, 280, 60)];
    middayLabel.backgroundColor = [UIColor clearColor];
    middayLabel.numberOfLines = 2;
    middayLabel.textColor = [UIColor whiteColor];
    middayLabel.font = [UIFont boldSystemFontOfSize:50];
    [bgImageView addSubview:middayLabel];
    [middayLabel release];
    

    
    ttimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeMethod:) userInfo:nil repeats:YES];
}
-(void)timeMethod:(NSTimer *)timer
{
    
    NSDateFormatter *formatter =[[[NSDateFormatter alloc] init] autorelease];
    NSDate *date = [NSDate date];
    [[NSDate date] timeIntervalSince1970];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *formatterStr = [formatter stringFromDate:date];
    NSString *f1 = [formatterStr substringToIndex:7];
    NSString *f2 = [formatterStr substringFromIndex:7];
    NSLog(@"f1: %@ \n f2:%@",f1, f2);
    timeLabel.text = f1;
    middayLabel.text = f2;
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    _gestureRecognizerDirectionUp = nil;
    _gestureRecognizerDirectionDown = nil;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [ttimer invalidate];
    ttimer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - mark UISwipeGestureRecognizer

- (void)swipeUpControl
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];

    bgImageView.frame = Scroll_View_Frame(View_Y);
    signView.frame = Sign_View_Frame(bgImageView.frame.size.height+View_Y);
    [pwTextField becomeFirstResponder];
    
    [UIView commitAnimations];
    
    [self.view removeGestureRecognizer:_gestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:_gestureRecognizerDirectionDown];
    
}

- (void)swipeDownControl
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    
    bgImageView.frame = Scroll_View_Frame(0);
    signView.frame = Sign_View_Frame(bgImageView.frame.size.height);
    [pwTextField resignFirstResponder];
    
    [UIView commitAnimations];
    
    [self.view removeGestureRecognizer:_gestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:_gestureRecognizerDirectionUp];

}

#pragma - mark

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text isEqualToString:@"qwe"]) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.7];
        [UIView setAnimationDelegate:self];
        
        bgImageView.frame = Scroll_View_Frame(-480);
        signView.frame = Sign_View_Frame(500);
        
        pwTextField.clearButtonMode = UITextFieldViewModeNever;
        pwTextField.backgroundColor = [UIColor clearColor];
        signView.backgroundColor = [UIColor clearColor];
        
        RootViewController *rootVC = [[RootViewController alloc] init];
        //rootVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:rootVC animated:YES];
        
        [UIView commitAnimations];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"", @"")
                                                        message:NSLocalizedString(@"Error,please input: qwe", @"")
                                                       delegate:self 
                                              cancelButtonTitle:NSLocalizedString(@"Ok", @"") 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }

    
    return YES;
}



@end
