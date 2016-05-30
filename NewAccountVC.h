//
//  NewAccountVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <sqlite3.h>
@interface NewAccountVC : UIViewController<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIButton *btnSave;
    IBOutlet UITextField *txtNote;
    
    IBOutlet UITextField *txtDeposit;
    
    IBOutlet UITextField *txtBalance;
    AppDelegate  *delegate;
    
    NSMutableArray *arrAllData,*arrCategoryImg;
    IBOutlet UIImageView *imgAccount;
    IBOutlet UIButton *btnImg;
    UIAlertController *alert;
    UITableView *categoryTbl;
    
}
- (IBAction)txtDepositClicked:(UITextField *)sender;

- (IBAction)btnBackClicked:(UIButton *)sender;
- (IBAction)btnSave:(UIButton *)sender;
- (IBAction)btnCameraImg:(UIButton *)sender;

@end
