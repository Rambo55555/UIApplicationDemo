//
//  SceneDelegate.m
//  UIApplicationDemo
//
//  Created by rambo on 2021/7/15.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    // 初始化 self.window
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 这个 ViewController 是新建的时候自带的，需要导入一下头文件
    ViewController *vc = [[ViewController alloc] init];
    //[self.window setRootViewController:vc];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    if(connectionOptions.userActivities.count > 0)
    {
        NSUserActivity *userActivity = connectionOptions.userActivities.allObjects.firstObject;
        [self scene:scene continueUserActivity:userActivity];
    }
    [self.window makeKeyAndVisible];

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    NSLog(@"Current class: %@ Current method: %@ Line: %d", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
}

- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity
{
    if(userActivity)
    {
        if([userActivity.activityType isEqualToString:@"com.apple.corespotlightitem"])
        {
            NSString *idetifier = userActivity.userInfo[@"kCSSearchableItemActivityIdentifier"];
            UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
            ViewController *vc = [navigationController viewControllers][0];
            [vc goToNewViewWithStr:idetifier];
        }
    }
}

@end
