//
//  AppDelegate.m
//  UIApplicationDemo
//
//  Created by rambo on 2021/7/15.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}

// 不起作用
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler
{
    UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
    [navi.topViewController restoreUserActivityState:userActivity];
    return YES;
}




@end
