//
//  NewTemplateVC.m
//  eWellyApps
//
//  Created by Vaksys on 19/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "NewTemplateVC.h"

@interface NewTemplateVC ()

@end

@implementation NewTemplateVC
static sqlite3 *database = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrAllData =[[NSMutableArray alloc]init];
    arrBalanceData=[[NSMutableArray alloc]init];

    delegate = [UIApplication sharedApplication].delegate;

    [ txtDate setTintColor:[UIColor clearColor]];
    [txtRecuuring setTintColor:[UIColor clearColor]];
    [ txtCategory setTintColor:[UIColor clearColor]];
    datePicker.hidden=YES;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    txtAmount.inputAccessoryView = numberToolbar;
    strTransactionType=@"Income";
    
    segmentedControl1 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Income", @"Expense"]];
    segmentedControl1.selectionIndicatorColor=[UIColor blueColor];
    
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    segmentedControl1.frame = CGRectMake(0, 60, viewWidth, 60);
    
    segmentedControl1.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl1.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl1.verticalDividerEnabled = YES;
    segmentedControl1.verticalDividerColor = [UIColor colorWithRed:38.0f/255.0f green:78.0f/255.0f blue:86.0f/255.0f alpha:0.1f];
    segmentedControl1.backgroundColor=[UIColor colorWithRed:231.0f/255.0f green:125.0f/255.0f blue:119.0f/255.0f alpha:0.8f];
    segmentedControl1.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    segmentedControl1.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor]};
    
    segmentedControl1.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    segmentedControl1.verticalDividerWidth = 0.0f;
    [segmentedControl1 addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl1];
    btnSave.layer.cornerRadius = 5;
[imgNewTemplate.layer setCornerRadius:imgNewTemplate.bounds.size.width/2];
    imgNewTemplate.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}
-(void)cancelNumberPad{
    [txtAmount resignFirstResponder];
    txtAmount.text = @"";
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = txtAmount.text;
    [txtAmount resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];

}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    if (segmentedControl.selectedSegmentIndex == 0) {
        
        strTransactionType=@"Income";
        txtAmount.text=@"+$200.00";

        txtAmount.textColor=[UIColor greenColor];

        
    }
    else if (segmentedControl.selectedSegmentIndex == 1){
        
        strTransactionType=@"Expense";
        txtAmount.text=@"-$200.00";
        txtAmount.textColor=[UIColor redColor];

    }
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [self animateTextField:textField up:YES];
    [txtCategory resignFirstResponder];
    [txtRecuuring resignFirstResponder];
    [txtDate resignFirstResponder];

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


- (IBAction)btnBackClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];
}

- (IBAction)txtDateClicked:(UITextField *)sender {
    datePicker.hidden=NO;
    
    [txtDate resignFirstResponder];
    
    datePicker.backgroundColor = [UIColor lightGrayColor];
    
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.hidden=NO;
    datePicker.date=[NSDate date];
    [datePicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
  
    
}
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    datePicker.hidden=YES;
    
}
-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MMMM dd, yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    //assign text to label
    txtDate.text=str;
}

-(void)save:(id)sender
{
    self.navigationItem.rightBarButtonItem=nil;
    [datePicker removeFromSuperview];
}

- (IBAction)txtRecuuringClicked:(UITextField *)sender {
    [txtRecuuring resignFirstResponder];
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Category:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Daily", @"Monthly",@"Weakly",  nil];
    //[txtCategory becomeFirstResponder];
    popup.tag = 1;
    
    [popup showInView:self.view];

}

- (IBAction)txtCategoryClicked:(UITextField *)sender {
    [self getAllData];
    alert = [UIAlertController alertControllerWithTitle:nil
                                                     message:@"Category\n\n\n\n\n\n\n\n\n\n\n"
                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
    alert.view.backgroundColor = [UIColor grayColor];
    [alert addAction:cancelAction];
    categoryTbl = [[UITableView alloc] initWithFrame:(CGRectMake(5,45,260,250))      style:UITableViewStylePlain];
    categoryTbl.dataSource = self;
    categoryTbl.delegate = self;
    categoryTbl.layer.borderWidth = 2.0;
    // [alert setBackgroundColor:[UIColor blueColor]
    
    //  [controller.view setUserInteractionEnabled:YES];
    [categoryTbl setUserInteractionEnabled:YES];
    [alert.view addSubview:categoryTbl];
    [self presentViewController:alert animated:NO completion:nil];}


//    [txtCategory resignFirstResponder];
//    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Category:"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:  nil];
//    popup.delegate = self;
//    for (NSString *title in arrAllData) {
//        [popup addButtonWithTitle:title];
//    }
//    //popup.cancelButtonIndex = [popup addButtonWithTitle:@"Cancel"];
//    
//    popup.tag = 2;
//    
//    [popup showInView:self.view];
//    [arrAllData removeAllObjects];
//    

    
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
    txtCategory.text=[arrAllData objectAtIndex:indexPath.row];
    imgNewTemplate.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
    NSLog(@"%@",imgNewTemplate.image);
    [alert dismissViewControllerAnimated:YES completion:nil];
}




- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(popup.tag == 1) {
        if(buttonIndex == 0) {
            txtRecuuring.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        if(buttonIndex == 1) {
            txtRecuuring.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }
        
        if(buttonIndex == 2) {
            txtRecuuring.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        
        
        
    }
    if(popup.tag == 2) {
        if(buttonIndex == 0) {
            //txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 1) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 2) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 3) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 4) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 5) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 6) {
            txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }

        
    }

}
- (IBAction)btnSaveClicked:(UIButton *)sender {
     NSString *replaceDollerValue = [txtAmount.text stringByReplacingOccurrencesOfString:@"+$" withString:@""];
    
    if (segmentedControl1.selectedSegmentIndex==0)
    {
        [self getBalance];
        int incomeBalance=[replaceDollerValue intValue];
        
        NSString *strBalance=[arrBalanceData objectAtIndex:0];
        int balances=[strBalance intValue];
        int mainBalance;
        mainBalance = incomeBalance+balances;
        
        
        NSDate * now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"HH:mm:ss"];
        NSString *newDateString = [outputFormatter stringFromDate:now];
        NSLog(@"newDateString %@", newDateString);
        
        
        
        
        
        sqlite3_stmt *statement = nil;
        
        if(sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK)
        {
            NSString *sqlStatement=[NSString stringWithFormat:@"update Balance set Money = \"%d\",UpdateTime = \"%@\" where id= %d ",mainBalance,newDateString,1];
            const char *sql = [sqlStatement UTF8String];
            
            if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement))
                {
                    //                [ShareSingleTon allocation];
                    //                [self getAllData];
                    NSLog(@"data inserted");
                }
                else
                {
                    NSLog(@"data is not inserted");
                }
            }
            sqlite3_finalize(statement);
            sqlite3_close(database);

        }
        
        
        
        
        
        
        sqlite3_stmt *statementInsert = nil;
        const char *dbpath = [delegate.databasePath UTF8String];
        
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            
            
            
//           NSString *insertSQL = [NSString stringWithFormat:@"delete from CategoryTb where id=4+"];
//                                  
            
            
            NSString *insertSQL = [NSString stringWithFormat:@"insert into TemplateTb (amount,Reason,category,recurring,payment_day,transaction_type,imageIcon) values (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",?)" ,replaceDollerValue,txtReason.text,txtCategory.text,txtRecuuring.text,txtDate.text,strTransactionType];
            
            const char *insert_stmt = [insertSQL UTF8String];
            if (sqlite3_prepare_v2(database, insert_stmt,-1, &statementInsert, NULL)==SQLITE_OK)
            {
                UIImage *image = imgNewTemplate.image;
                NSData *imageData=UIImagePNGRepresentation(image);
                sqlite3_bind_blob(statementInsert, 1, [imageData bytes], [imageData length], SQLITE_TRANSIENT);
                if (sqlite3_step(statementInsert) == SQLITE_DONE)
                {
                    
                    
                    
                }
                else
                {
                    NSLog(@"error: %s", sqlite3_errmsg(database));
                    //return NO;
                }
                
            }
            NSLog(@"error: %s", sqlite3_errmsg(database));
            sqlite3_reset(statementInsert);
        }
        
        
        
        
    }
    else if (segmentedControl1.selectedSegmentIndex==1)
    {
        [self getBalance];
        int expenseBalance=[replaceDollerValue intValue];
        
        NSString *strBalance=[arrBalanceData objectAtIndex:0];
        int tblBalances=[strBalance intValue];
        
        
        
        NSDate * now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"HH:mm:ss"];
        NSString *newDateString = [outputFormatter stringFromDate:now];
        NSLog(@"newDateString %@", newDateString);
        //200<=400
        if (expenseBalance<=tblBalances) {
            
            int mainBalance;
            mainBalance = tblBalances-expenseBalance;
            
            sqlite3_stmt *statement = nil;
            
            if(sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK)
            {
                NSString *sqlStatement=[NSString stringWithFormat:@"update Balance set Money = \"%d\",UpdateTime = \"%@\" where id= %d ",mainBalance,newDateString,1];
                const char *sql = [sqlStatement UTF8String];
                
                if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK)
                {
                    if (sqlite3_step(statement))
                    {
                        //                [ShareSingleTon allocation];
                        //                [self getAllData];
                        NSLog(@"data inserted");
                    }
                    else
                    {
                        NSLog(@"data is not inserted");
                    }
                }
                sqlite3_finalize(statement);
                sqlite3_close(database);

            }
     sqlite3_stmt *statementInsert = nil;
            const char *dbpath = [delegate.databasePath UTF8String];
            NSString *replaceExpance = [txtAmount.text stringByReplacingOccurrencesOfString:@"-$" withString:@""];

            
            if (sqlite3_open(dbpath, &database) == SQLITE_OK)
            {
                
                NSString *insertSQL = [NSString stringWithFormat:@"insert into TemplateTb (amount,Reason,category,recurring,payment_day,transaction_type,imageIcon) values (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",?)" ,replaceExpance,txtReason.text,txtCategory.text,txtRecuuring.text,txtDate.text,strTransactionType];
                
                const char *insert_stmt = [insertSQL UTF8String];
                if (sqlite3_prepare_v2(database, insert_stmt,-1, &statementInsert, NULL)==SQLITE_OK)
                {
                    
                    UIImage *image = imgNewTemplate.image;
                    NSData *imageData=UIImagePNGRepresentation(image);
                    sqlite3_bind_blob(statementInsert, 1, [imageData bytes], [imageData length], SQLITE_TRANSIENT);
                    if (sqlite3_step(statementInsert) == SQLITE_DONE)
                    {
                        
                        
                        
                    }
                    else
                    {
                        NSLog(@"error: %s", sqlite3_errmsg(database));
                        //return NO;
                    }
                    
                }
                NSLog(@"error: %s", sqlite3_errmsg(database));
                sqlite3_reset(statementInsert);
            }
    
        }else{
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Expense" message:@"Main Balance less!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alt show];
            
            
        }
        
    }


    
}

-(NSMutableArray*)getBalance{
    [arrBalanceData removeAllObjects];
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM Balance"];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                char *cName = (char *) sqlite3_column_text(statement, 1);
                NSString *strName= [[NSString alloc] initWithUTF8String:cName];
                [arrBalanceData addObject:strName];
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrBalanceData;
    
    
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
