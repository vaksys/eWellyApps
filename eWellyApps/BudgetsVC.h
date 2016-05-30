//
//  BudgetsVC.h
//  eWellyApps
//
//  Created by Vaksys on 12/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewBudgetsVC.h"
#import "VCFloatingActionButton.h"
#import "TransactionVC.h"
@interface BudgetsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,floatMenuDelegate>{
    
    IBOutlet UITableView *tblBudgets;
    
    
    UIButton *floattingButtons;
    
}
- (IBAction)BtnAddClicked:(UIButton *)sender;
@property (strong, nonatomic) VCFloatingActionButton *addButton;

@end
