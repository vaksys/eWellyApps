//
//  TransactionVC.h
//  eWellyApps
//
//  Created by Vaksys on 10/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "NewBudgetsVC.h"
#import "VCFloatingActionButton.h"
#import <sqlite3.h>
#import "AppDelegate.h"
@interface TransactionVC : UIViewController<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITextField *txtSalary;
    IBOutlet UITextField *txtAmount;
    IBOutlet UITextField *txtDeposit;
    IBOutlet UITextField *txtDate;

    IBOutlet UIButton *btnTwo;
    IBOutlet UIButton *btnOne;
    
    IBOutlet UIButton *btnThree;
    IBOutlet UIView *viewsalaryMenu;
    
    UIBarButtonItem  *rightBtn;
    UIActionSheet *popup2;
    NSString *strTransactionType;
   AppDelegate *delegate;
    NSMutableArray *arrAllData,*arrBankData,*arrId;
    NSMutableArray *arrBalanceData,*arrBalanceIdWise;
    NSString *strid;
    HMSegmentedControl *segmentedControl1;
    IBOutlet UITableView *tblDeposit;
    int CategoryAccId;
    int idImg;
    NSMutableArray *arrCategoryImg;
    
    IBOutlet UIImageView *imgTransaction;
    
    UITableView *  tblCategory;
    UITableView *tblAccount;
    UIAlertController *alert;
    
}
- (IBAction)btnCameraClicked:(UIButton *)sender;
- (IBAction)btnCancelClicked:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)btnSaveClicked:(UIButton *)sender;
@property (nonatomic, strong) UIColor *selectionIndicatorColor UI_APPEARANCE_SELECTOR;
@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;

- (IBAction)txtSalary:(UITextField *)sender;
- (IBAction)btnSalary:(id)sender;
- (IBAction)txtDatePicker:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtCategorySalary;

- (IBAction)txtCategory:(UITextField *)sender;
- (IBAction)txtDeposit:(UITextField *)sender;

@end
