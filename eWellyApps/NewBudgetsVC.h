//
//  NewBudgetsVC.h
//  eWellyApps
//
//  Created by Vaksys on 12/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NewBudgetsVC : UIViewController<UIActionSheetDelegate>
{
    IBOutlet UIButton *btnSave;

    
    IBOutlet UITextField *txtStartDate;
    
    IBOutlet UITextField *txtAmount;
    IBOutlet UITextField *txtCategory;
    
    IBOutlet UIView *CategoryView;
    IBOutlet UIButton *btnC1;
    
    IBOutlet UIButton *btnC2;
    
    IBOutlet UIButton *btnC3;
    
    IBOutlet UIButton *btnC4;
    
    
}
- (IBAction)txtCategoryClicked:(UITextField *)sender;

- (IBAction)btnCategoryClicked:(id)sender;

- (IBAction)btnBack:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtEndDate;
- (IBAction)txtStartDateClicked:(UITextField *)sender;
- (IBAction)txtEndDateClicked:(UITextField *)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker1;
- (IBAction)btnCamera:(UIButton *)sender;


@end
