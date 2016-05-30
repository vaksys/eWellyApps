//
//  NewTemplateVC.h
//  eWellyApps
//
//  Created by Vaksys on 19/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "AppDelegate.h"
#import <sqlite3.h>
@interface NewTemplateVC : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSString *strTransactionType;
    
    IBOutlet UITextField *txtReason;
    IBOutlet UITextField *txtAmount;
    
    IBOutlet UITextField *txtCategory;
    

    IBOutlet UIButton *btnSave;
    
    IBOutlet UIDatePicker *datePicker;
    
    IBOutlet UITextField *txtDate;
    
    IBOutlet UITextField *txtRecuuring;
    NSMutableArray *arrAllData,*arrCategoryImg;
    NSMutableArray *arrBalanceData;
    UIAlertController *alert;
    UITableView *categoryTbl;
    AppDelegate *delegate;
    HMSegmentedControl *segmentedControl1;
    
    IBOutlet UIImageView *imgNewTemplate;
    
}
- (IBAction)btnSaveClicked:(UIButton *)sender;
- (IBAction)btnBackClicked:(UIButton *)sender;
- (IBAction)txtDateClicked:(UITextField *)sender;
- (IBAction)txtRecuuringClicked:(UITextField *)sender;
- (IBAction)txtCategoryClicked:(UITextField *)sender;




@end
