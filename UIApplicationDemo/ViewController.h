//
//  ViewController.h
//  UIApplicationDemo
//
//  Created by rambo on 2021/7/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSUserActivity *userActivity;

- (void)goToNewViewWithStr:(NSString*) str;

@end

