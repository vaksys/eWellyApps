//
//  NewCategoryVC.h
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <sqlite3.h>

@interface NewCategoryVC : UIViewController<UIImagePickerControllerDelegate>
{
    
    IBOutlet UIButton *btnSave;
    AppDelegate *delegate;
    
    IBOutlet UITextField *txtName;
    IBOutlet UITextField *txtIcon;
    IBOutlet UIImageView *imgIcon;
    
    IBOutlet UIButton *btnimg;
    UIImage * img;
    
    
}
- (IBAction)btnImgGallary:(UIButton *)sender;

- (IBAction)btnBackClicked:(UIButton *)sender;

- (IBAction)btnSave:(UIButton *)sender;

@end
