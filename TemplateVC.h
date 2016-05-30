//
//  TemplateVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionVC.h"
#import "NewTemplateVC.h"
#import "AppDelegate.h"
@interface TemplateVC : UIViewController
{
    IBOutlet UITableView *tblTemplate;
    UIButton *floattingButtons;
    NSMutableArray *arrIncome,*arrAmountIncome,*arrIncomeImg;
    NSMutableArray *arrReason,*arrIncomeCategory,*arrpamentDate;
    NSMutableArray *arrIncomeExpense,*arrAmountExpense,*arrExpenseImg;
    NSMutableArray *arrReasonExpense,*arrIncomeCategoryExpense,*arrpamentDateExpense;
    AppDelegate *delegate;
    
}
- (IBAction)btnBackClicked:(UIButton *)sender;



@end
