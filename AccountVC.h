//
//  AccountVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionVC.h"
#import "NewAccountVC.h"
#import "AppDelegate.h"
@interface AccountVC : UIViewController
{
    IBOutlet UITableView *tblAccount;
    UIButton *floattingButtons;
    AppDelegate *delegate;
    NSMutableArray *arrCategoryNote,*arrCategoryType,*arrCategoryBalance,*arrCategoryImg;
}
- (IBAction)btnBackClicked:(UIButton *)sender;

@end
