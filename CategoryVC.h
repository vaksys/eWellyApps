//
//  CategoryVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionVC.h"
#import "NewCategoryVC.h"
#import "AppDelegate.h"
@interface CategoryVC : UIViewController
{
    IBOutlet UITableView *tblCategory;
    UIButton *floattingButtons;
    AppDelegate *delegate;
    NSMutableArray *arrCategoryName,*arrCategoryImg;
}
- (IBAction)btnBackClicked:(UIButton *)sender;




@end
