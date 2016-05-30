//
//  AppDelegate.h
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *databasePath;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UIImageView *splashView;
@property (strong, nonatomic) NSString *databasePath;

@end

