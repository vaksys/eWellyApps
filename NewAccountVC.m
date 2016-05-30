//
//  NewAccountVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "NewAccountVC.h"

@interface NewAccountVC ()

@end

@implementation NewAccountVC
static sqlite3 *database = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrAllData=[[NSMutableArray alloc]init];
    
    delegate = [UIApplication sharedApplication].delegate;

    self.navigationController.navigationBar.hidden=YES;
     btnSave.layer.cornerRadius = 5;
     [txtDeposit setTintColor:[UIColor clearColor]];
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    txtBalance.inputAccessoryView = numberToolbar;
    [imgAccount.layer setCornerRadius:imgAccount.bounds.size.width/2]; imgAccount.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}
-(void)cancelNumberPad{
    [txtBalance resignFirstResponder];
    txtBalance.text = @"";
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = txtBalance.text;
    [txtBalance resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
    [txtDeposit resignFirstResponder];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    int txtPosition = (textField.frame.origin.y - 100);
    const int movementDistance = (txtPosition < 0 ? 0 : txtPosition); // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)txtDepositClicked:(UITextField *)sender {
    [self getAllData];
    
    
    alert = [UIAlertController      alertControllerWithTitle:nil
                                                     message:@"Category\n\n\n\n\n\n\n\n\n\n\n"
                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
    alert.view.backgroundColor = [UIColor grayColor];
    [alert addAction:cancelAction];
    categoryTbl = [[UITableView alloc] initWithFrame:(CGRectMake(5,45,260,250))      style:UITableViewStylePlain];
    categoryTbl.dataSource = self;
    categoryTbl.delegate = self;
    categoryTbl.layer.borderWidth = 1.0;
    // [alert setBackgroundColor:[UIColor blueColor]
    
    //  [controller.view setUserInteractionEnabled:YES];
    [categoryTbl setUserInteractionEnabled:YES];
    [alert.view addSubview:categoryTbl];
    [self presentViewController:alert animated:NO completion:nil];}

    
    
    
    
//    [txtDeposit resignFirstResponder];
//    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Category:"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:  nil];
//    popup.delegate = self;
//    for (NSString *title in arrAllData) {
//        [popup addButtonWithTitle:title];
//    }
//   // popup.cancelButtonIndex = [popup addButtonWithTitle:@"Cancel"];
//
//    popup.tag = 1;
//    
//    [popup showInView:self.view];
//    [arrAllData removeAllObjects];
    

//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
           return arrAllData.count;
    }



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cell";
    
    UITableViewCell *cell=[categoryTbl dequeueReusableCellWithIdentifier:cellidentifier];
    //[cell configUI:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier];
        
    }
   
        
        //        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        
        
        
        UILabel *lblname=[[UILabel alloc]initWithFrame:(CGRectMake(45, 5, 150, 40))];
        lblname.textAlignment = NSTextAlignmentCenter;
        lblname.text=[arrAllData objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lblname];
         UIImageView *img=[[UIImageView alloc]initWithFrame:(CGRectMake(10, 5, 30, 30))];
                [img.layer setCornerRadius:img.bounds.size.width/2];
                img.clipsToBounds = YES;
                //img.image=[UIImage imageNamed:@"Layer3_3.png"];
        
                img.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
                [cell.contentView addSubview:img];
        
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
           txtDeposit.text=[arrAllData objectAtIndex:indexPath.row];
        imgAccount.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
        NSLog(@"%@",imgAccount.image);
        [alert dismissViewControllerAnimated:YES completion:nil];
    }


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(popup.tag == 1) {
        if(buttonIndex == 0) {
            //txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        if(buttonIndex == 1) {
            txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }
        if(buttonIndex == 2) {
            txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        if(buttonIndex == 3) {
            txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }

        if(buttonIndex == 4) {
            txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        if(buttonIndex == 5) {
            txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }

    }
}
- (IBAction)btnBackClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];

}

- (IBAction)btnSave:(UIButton *)sender {
     NSString *replaceDollerValue = [txtBalance.text stringByReplacingOccurrencesOfString:@"+$" withString:@""];
    sqlite3_stmt *statement = nil;
    const char *dbpath = [delegate.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        
        
        
        
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into AccountTb (account_name,category,balance,imageIcon) values (\"%@\",\"%@\",\"%@\",?)" ,txtNote.text,txtDeposit.text,replaceDollerValue];
        const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL)==SQLITE_OK)
        {
            
            UIImage *image = imgAccount.image;
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

- (IBAction)btnCameraImg:(UIButton *)sender {
}


-(NSMutableArray*)getAllData
{
    [arrAllData removeAllObjects];
    [arrCategoryImg removeAllObjects];
    arrCategoryImg=[[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM CategoryTb"];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                int length = sqlite3_column_bytes(statement, 2);
                NSData *imageData = [NSData dataWithBytes:sqlite3_column_blob(statement, 2) length:length];
                
                NSLog(@"Length : %lu", (unsigned long)[imageData length]);
                
                if(imageData == nil)
                    NSLog(@"No image found.");
                else
                    [arrCategoryImg addObject:imageData];

                
                char *cName = (char *) sqlite3_column_text(statement, 1);
                             NSString *strName= [[NSString alloc] initWithUTF8String:cName];
                
                
                [arrAllData addObject:strName];
            }
            
            sqlite3_finalize(statement);
        }
         NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrAllData;
}

@end
