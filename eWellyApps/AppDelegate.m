//
//  AppDelegate.m
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databasePath;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    CGRect tabbarFrame = tabBarController.tabBar.frame;
    tabbarFrame.size.height += 120;
    tabBarController.tabBar.frame = tabbarFrame;
    
    tabBarItem1.title = @"";
    tabBarItem2.title = @"";
    tabBarItem3.title = @"";
    //tabBarItem4.title = @"Settings";
    
    databasePath=[[NSString alloc]init];
    
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"menu1-hover.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.image = [[UIImage imageNamed:@"menu1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
tabBarItem1.imageInsets = UIEdgeInsetsMake(6,0,-6,0);
    
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"menu2-hover.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.image = [[UIImage imageNamed:@"menu2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.imageInsets = UIEdgeInsetsMake(6,0,-6,0);

    
    
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"menu3-hover.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.image = [[UIImage imageNamed:@"menu3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.imageInsets = UIEdgeInsetsMake(6,0,-6,0);

    
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"menu4-hover.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.image = [[UIImage imageNamed:@"menu4.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.imageInsets = UIEdgeInsetsMake(6,0,-6,0);
    
    
    [DBManager getSharedInstance];

    
    
//    
//    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"menu1-hover.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu1.png"]];
//    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"menu2-hover.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu2.png"]];
//    
//    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"menu3-hover.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu3.png"]];
//  [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"menu4-hover.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu4.png"]];
//    UIImage* tabBarBackground = [UIImage imageNamed:@"menu3-hover.png"];
//    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"menu4-hover.png"]];
    
    
    
//    
//        [_window addSubview:_viewController.view];
//        [_window makeKeyAndVisible];
//        [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
//        _splashView=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _splashView.image = [UIImage imageNamed:@"Splash.png"];
//        //[NSThread sleepForTimeInterval:2];
//    
//        [UIView transitionWithView:self.window duration:15.0f options:UIViewAnimationOptionTransitionNone animations:^(void){_splashView.alpha=0.0f;} completion:^(BOOL finished){[_splashView removeFromSuperview];}];
//        [_window addSubview:_splashView];
//        [_window bringSubviewToFront:_splashView];
//        

    
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
