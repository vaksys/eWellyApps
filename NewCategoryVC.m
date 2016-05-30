//
//  NewCategoryVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "NewCategoryVC.h"

@interface NewCategoryVC ()

@end

@implementation NewCategoryVC
static sqlite3 *database = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationController.navigationBar.hidden=YES;
        btnSave.layer.cornerRadius = 5;
        [imgIcon.layer setCornerRadius:imgIcon.bounds.size.width/2]; imgIcon.clipsToBounds = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
}


- (IBAction)btnBackClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];
}

- (IBAction)btnSave:(UIButton *)sender {
    delegate = [UIApplication sharedApplication].delegate;

    sqlite3_stmt *statement = nil;
    const char *dbpath = [delegate.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
     {
        
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into CategoryTb (category_name,icon) values (\"%@\",?)" ,txtName.text];
        
       const char *insert_stmt = [insertSQL UTF8String];
        
        if (sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL)==SQLITE_OK)
        {
            
            UIImage *image = imgIcon.image;
            NSData *imageData=UIImagePNGRepresentation(image);
            sqlite3_bind_blob(statement, 1, [imageData bytes], [imageData length], SQLITE_TRANSIENT);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
               
                
                
            }
            else
            {
                NSLog(@"error: %s", sqlite3_errmsg(database));
                //return NO;
            }
            
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_reset(statement);
    }
    
}
- (IBAction)btnImgGallary:(UIButton *)sender {
    
    UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
    pickerView.allowsEditing = YES;
    pickerView.delegate = self;
    [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentModalViewController:pickerView animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [self dismissModalViewControllerAnimated:true];
    
    UIImage * img = [info valueForKey:UIImagePickerControllerEditedImage];
    
    imgIcon.image = img;
    
}

@end
