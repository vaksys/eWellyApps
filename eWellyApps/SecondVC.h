//
//  SecondVC.h
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "SectionCell.h"
#import "TransactionVC.h"
#import "NewBudgetsVC.h"
#import "VCFloatingActionButton.h"
#import "AppDelegate.h"
@interface SecondVC : UIViewController<UIActionSheetDelegate,floatMenuDelegate,UITableViewDelegate,UITableViewDataSource,VCFloatingActionButtonDelegate>
{
    NSMutableArray *arrImg,*arrName,*arrDate,*arrPrize,*arrCategory;
    NSMutableArray *arrImg1,*arrName1,*arrDate1,*arrPrize1,*arrCategory1;

    IBOutlet UIButton *btnAdd;
    
    IBOutlet UITableView *tblList;
    IBOutlet UIView *menuDateView;
    
    IBOutlet UIButton *btnFloattingButton;
    UIButton *floattingButtons;
    
    
    IBOutlet UIButton *btnNext;
    
    IBOutlet UIButton *btnPrevious;
    IBOutlet UILabel *lblStartDate;
    
    IBOutlet UILabel *lblEndDate;
     NSString*  dateEndPrev;
    NSString*   dateString2Prev;
     NSString *stringFromTime;
    AppDelegate *delegate;
    NSMutableArray *arrIncome,*arrAmountIncome,*arrCategoryImgIncome;
    NSMutableArray *arrReason,*arrIncomeCategory,*arrpamentDate;
    NSMutableArray *arrIncomeExpense,*arrAmountExpense,*arrCategoryImgExpense;
    NSMutableArray *arrReasonExpense,*arrIncomeCategoryExpense,*arrpamentDateExpense;

    IBOutlet UILabel *lblIncome;
    
    IBOutlet UILabel *lblExpense;
    
    IBOutlet UILabel *lblTotalIncomeExpense;
    HMSegmentedControl *segmentedControl1;
}
- (IBAction)btnNext:(UIButton *)sender;
- (IBAction)btnNextDateClicked:(UIButton *)sender;
- (IBAction)btnPreviousDateClicked:(UIButton *)sender;
@property(nonatomic, retain) NSDate *currentDate;

@property (strong, nonatomic) VCFloatingActionButton *addButton;

@end
