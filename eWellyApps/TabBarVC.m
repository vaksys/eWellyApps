//
//  TabBarVC.m
//  eWellyApps
//
//  Created by Vaksys on 13/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect tabbarFrame = self.tabBarController.tabBar.frame;
    tabbarFrame.size.height += 120;
    self.tabBarController.tabBar.frame = tabbarFrame;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
