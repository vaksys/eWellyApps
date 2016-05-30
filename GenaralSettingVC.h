//
//  GenaralSettingVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "AppDelegate.h"
@interface GenaralSettingVC : UIViewController
{
    IBOutlet UIButton *btnSave;
    
    IBOutlet UIPickerView *picker;
    IBOutlet UITextField *txtCurrency;
    NSArray *curruncyArray;
    AppDelegate *delegate;

}
- (IBAction)txtCurruncyClicked:(UITextField *)sender;

- (IBAction)btnBackClicked:(UIButton *)sender;
- (IBAction)btnSave:(UIButton *)sender;

@end
