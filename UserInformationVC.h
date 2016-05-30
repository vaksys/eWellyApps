//
//  UserInformationVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "AppDelegate.h"
@interface UserInformationVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *txtName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtcontry;
    IBOutlet UIButton *btnSave;
    NSArray *countryArray;
    
    IBOutlet UIPickerView *pickerViews;
    AppDelegate *delegate; 
}

- (IBAction)txtCountryClicked:(UITextField *)sender;

- (IBAction)btnBackClicked:(UIButton *)sender;

- (IBAction)btnSave:(UIButton *)sender;

@end
