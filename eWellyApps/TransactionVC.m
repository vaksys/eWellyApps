//
//  TransactionVC.m
//  eWellyApps
//
//  Created by Vaksys on 10/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "TransactionVC.h"

@interface TransactionVC ()

@end

@implementation TransactionVC
static sqlite3 *database = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarController.tabBar setHidden:YES];
    
       VCFloatingActionButton *categoryTableViewInstance = [[VCFloatingActionButton alloc] init];
    [categoryTableViewInstance setDelegate:self];
    //Hide Curser
    //[txtSalary setTintColor:[UIColor clearColor]];
    [ _txtCategorySalary setTintColor:[UIColor clearColor]];
    [txtDate setTintColor:[UIColor clearColor]];
    [ txtDeposit setTintColor:[UIColor clearColor]];
    
    viewsalaryMenu.hidden=YES;
    _datepicker.hidden=YES;
    viewsalaryMenu.layer.cornerRadius=5;
    viewsalaryMenu.layer.borderWidth=2;
    viewsalaryMenu.layer.borderColor=[UIColor blackColor].CGColor;
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
    _btnSave.layer.cornerRadius = 5;
    
    //Sqlite
    arrAllData=[[NSMutableArray alloc]init];
    arrBalanceData=[[NSMutableArray alloc]init];
    arrBankData=[[NSMutableArray alloc]init];
    arrId=[[NSMutableArray alloc]init];
    arrBalanceIdWise=[[NSMutableArray alloc]init];
    
    delegate=[UIApplication sharedApplication].delegate;
    [tblDeposit setHidden:YES];
    tblDeposit.layer.cornerRadius=5;
    //tblDeposit.backgroundColor=[UIColor grayColor];
    [self getbankList];
    tblDeposit.tableFooterView = [[UIView alloc] init] ;
[imgTransaction.layer setCornerRadius:imgTransaction.bounds.size.width/2];
    imgTransaction.clipsToBounds = YES;
    
    
}
-(void)pushViewControllerUsinDelegate:(UIViewController *)viewController
{
 [self.navigationController pushViewController:viewController animated:YES];
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
-(void)cancelNumberPad{
    [txtAmount resignFirstResponder];
    txtAmount.text = @"";
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = txtAmount.text;
    [txtAmount resignFirstResponder];
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

- (IBAction)btnCameraClicked:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        [self presentModalViewController:imagePicker animated:YES];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // You have the image. You can use this to present the image in the next view like you require in `#3`.
    
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)btnCancelClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];

}

- (IBAction)btnSaveClicked:(UIButton *)sender {
    //    delegate = [UIApplication sharedApplication].delegate;
    NSString *replaceDollerValue = [txtAmount.text stringByReplacingOccurrencesOfString:@"+$" withString:@""];
    
    if (segmentedControl1.selectedSegmentIndex==0)
    {
        [self getBalance];
        [self getIdWiseBalance];
        
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
            
        }
        sqlite3_close(database);
    
//// Account Wise Deposit
        
        NSString *strAccountBalance=[arrBalanceIdWise objectAtIndex:0];
        int accountbalances=[strAccountBalance intValue];
        int accBalance;
        accBalance = incomeBalance+accountbalances;
    
        sqlite3_stmt *statementAcc = nil;
        
        if(sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK)
        {
            NSString *sqlStatement=[NSString stringWithFormat:@"update AccountTb set balance = \"%d\" where id= %d ",accBalance,CategoryAccId];
            const char *sql = [sqlStatement UTF8String];
            
            if (sqlite3_prepare_v2(database, sql, -1, &statementAcc, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statementAcc))
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
            sqlite3_finalize(statementAcc);
            
        }
        sqlite3_close(database);

        //
        
        
        sqlite3_stmt *statementInsert = nil;
        const char *dbpath = [delegate.databasePath UTF8String];
         NSString *AmountValues = [txtAmount.text stringByReplacingOccurrencesOfString:@"+$" withString:@""];
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            NSString *insertSQL = [NSString stringWithFormat:@"insert into TransactionTb (amount,reason,category,paymentday,default_account,transaction_type,ImageIcon) values (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",?)" ,AmountValues,txtSalary.text,_txtCategorySalary.text,txtDate.text,txtDeposit.text,strTransactionType];
            
            const char *insert_stmt = [insertSQL UTF8String];
            if (sqlite3_prepare_v2(database, insert_stmt,-1, &statementInsert, NULL)==SQLITE_OK)
            {
                UIImage *image = imgTransaction.image;
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
        [self getIdWiseBalance];
        
       // NSString *balance=txtAmount.text;
        
         NSString *replaceDollerValueExpense = [txtAmount.text stringByReplacingOccurrencesOfString:@"-$" withString:@""];
        int expenseBalance=[replaceDollerValueExpense intValue];
        
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
                
            }
            sqlite3_close(database);
            ////  AccountWise
            NSString *strAccountBalance=[arrBalanceIdWise objectAtIndex:0];
            int accountbalancesExpense=[strAccountBalance intValue];
            int accBalanceExpense;
            accBalanceExpense =accountbalancesExpense -expenseBalance;
            
            sqlite3_stmt *statementAcc = nil;
            
            if(sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK)
            {
                NSString *sqlStatement=[NSString stringWithFormat:@"update AccountTb set balance = \"%d\" where id= %d ",accBalanceExpense,CategoryAccId];
                const char *sql = [sqlStatement UTF8String];
                
                if (sqlite3_prepare_v2(database, sql, -1, &statementAcc, NULL) == SQLITE_OK)
                {
                    if (sqlite3_step(statementAcc))
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
                sqlite3_finalize(statementAcc);
                
            }
            sqlite3_close(database);
            

            
            
            
            
            
            sqlite3_stmt *statementInsert = nil;
            const char *dbpath = [delegate.databasePath UTF8String];
            NSString *AmountValues = [txtAmount.text stringByReplacingOccurrencesOfString:@"-$" withString:@""];
            
            if (sqlite3_open(dbpath, &database) == SQLITE_OK)
            {
                NSString *insertSQL = [NSString stringWithFormat:@"insert into TransactionTb (amount,reason,category,paymentday,default_account,transaction_type) values (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")" ,AmountValues,txtSalary.text,_txtCategorySalary.text,txtDate.text,txtDeposit.text,strTransactionType];
                
                const char *insert_stmt = [insertSQL UTF8String];
                if (sqlite3_prepare_v2(database, insert_stmt,-1, &statementInsert, NULL)==SQLITE_OK)
                {
                    UIImage *image = imgTransaction.image;
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
            {    int length = sqlite3_column_bytes(statement, 2);
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
-(NSMutableArray*)getbankList
{
    [arrBankData removeAllObjects];
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM AccountTb"];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                char *categoryId = (char *) sqlite3_column_text(statement, 0);
                
                
                NSString *strid= [[NSString alloc] initWithUTF8String:categoryId];
                
                char *cNote = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strNote= [[NSString alloc] initWithUTF8String:cNote];
                
                [arrBankData addObject:strNote];
                [arrId addObject:strid];
                
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrBankData;
}
-(NSMutableArray*)getIdWiseBalance{
    [arrBalanceIdWise removeAllObjects];
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        
        CategoryAccId = [strid intValue];

        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM AccountTb where id=%d",CategoryAccId];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                char *cName = (char *) sqlite3_column_text(statement, 3);
               
                
                NSString *strName= [[NSString alloc] initWithUTF8String:cName];
                
                
                [arrBalanceIdWise addObject:strName];
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrBalanceIdWise;
    
    
}

- (IBAction)txtSalary:(UITextField *)sender
{
    
    
    //  [txtSalary resignFirstResponder];
//    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Category:"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:@"50000", @"25000", @"70000", @"60000", @"19000", nil];
//    popup.tag = 1;
//    
//    [popup showInView:self.view];

    viewsalaryMenu.hidden=YES;
    
}
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(popup.tag == 1) {
        if(buttonIndex == 0) {
            txtSalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 1) {
              txtSalary.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }
        
        if(buttonIndex == 2) {
            txtSalary.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        if(buttonIndex == 3) {
            txtSalary.text=[popup buttonTitleAtIndex:buttonIndex];
            return;
        }
        if(buttonIndex == 4) {
            txtSalary.text=[popup buttonTitleAtIndex:buttonIndex];            return;
        }
        
        
        
    }
    if(popup.tag == 2) {
        
      
        
        
        
        if(buttonIndex == 0) {
            //_txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
           // _txtCategorySalary.text=[arrAllData objectAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 1) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
             imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            
            //idImg=[[arrAllData objectAtIndex:buttonIndex]intValue];
            NSLog(@"%@",imgTransaction.image);
            
            
            return;
        }
        if(buttonIndex == 2) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            
            return;
        }
        if(buttonIndex == 3) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            
            return;
        }
        if(buttonIndex == 4) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            return;
        }
        if(buttonIndex == 5) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            return;
        }
        if(buttonIndex == 6) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            return;
        }
        if(buttonIndex == 7) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:buttonIndex]];
            NSLog(@"%@",imgTransaction.image);

            return;
        }
        if(buttonIndex == 8) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 9) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 10) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 11) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 12) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        if(buttonIndex == 13) {
            _txtCategorySalary.text=[popup buttonTitleAtIndex:buttonIndex];
            
            return;
        }
        


    }

if(popup.tag == 3) {
    if(buttonIndex == 0) {
//        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
//            strid=[arrId objectAtIndex:buttonIndex];
        
        return;
    }
    if(buttonIndex == 1) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 2) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 3) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 4) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 5) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 6) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }
    if(buttonIndex == 7) {
        txtDeposit.text=[popup buttonTitleAtIndex:buttonIndex];
        strid=[arrId objectAtIndex:buttonIndex];

        return;
    }

}
    [arrId removeAllObjects];
    
}
- (IBAction)btnSalary:(id)sender {
    if ([sender tag] == 11) {
        txtSalary.text=btnOne.titleLabel.text;
    }
    if ([sender tag] == 12) {
        txtSalary.text=btnTwo.titleLabel.text;
    }
    if ([sender tag] == 13) {
        txtSalary.text=btnThree.titleLabel.text;
    }
    viewsalaryMenu.hidden=YES;
    
}

- (IBAction)txtDatePicker:(id)sender {
            [txtDate resignFirstResponder];

    _datepicker.backgroundColor = [UIColor lightGrayColor];

    _datepicker.datePickerMode=UIDatePickerModeDate;
    _datepicker.hidden=NO;
    _datepicker.date=[NSDate date];
    [_datepicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_datepicker];
  rightBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];

}
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    _datepicker.hidden=YES;
    tblDeposit.hidden=YES;
    
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
    [_txtCategorySalary resignFirstResponder];
    [txtDate resignFirstResponder];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    int txtPosition = (textField.frame.origin.y - 50);
    const int movementDistance = (txtPosition < 0 ? 0 : txtPosition); // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}
-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
   // dateFormat.dateStyle=NSDateIntervalFormatterNoStyle
    //;
    [dateFormat setDateFormat:@"MMMM dd, yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:_datepicker.date]];
    //assign text to label
    txtDate.text=str;
}

-(void)save:(id)sender
{
    self.navigationItem.rightBarButtonItem=nil;
    [_datepicker removeFromSuperview];
}
- (IBAction)txtCategory:(UITextField *)sender {
    [self getAllData];
//    if (arrAllData==nil) {
//        
//    }else{
    
    alert = [UIAlertController      alertControllerWithTitle:nil
                                                     message:@"Category\n\n\n\n\n\n\n\n\n\n\n"
                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
    alert.view.backgroundColor = [UIColor grayColor];
    [alert addAction:cancelAction];
    tblCategory = [[UITableView alloc] initWithFrame:(CGRectMake(5,45,260,250))      style:UITableViewStylePlain];
    tblCategory.dataSource = self;
    tblCategory.delegate = self;
    tblCategory.layer.borderWidth = 1.0;
    // [alert setBackgroundColor:[UIColor blueColor]
    
    //  [controller.view setUserInteractionEnabled:YES];
    [tblCategory setUserInteractionEnabled:YES];
    [alert.view addSubview:tblCategory];
    [self presentViewController:alert animated:NO completion:nil];}







    
    
    
    
    
    
    
    
    
//    
//    [_txtCategorySalary resignFirstResponder];
//    popup2 = [[UIActionSheet alloc] initWithTitle:@"Category:"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:nil,nil];
//    //[txtCategory becomeFirstResponder];
//    
//    popup2.delegate = self;
//    for (NSString *title in arrAllData) {
//        [popup2 addButtonWithTitle:title];
//    }
//
//    
//    
//    popup2.tag = 2;
//    
//    [popup2 showInView:self.view];
//    [arrAllData removeAllObjects];
   // }
//}

- (IBAction)txtDeposit:(UITextField *)sender {
    alert = [UIAlertController      alertControllerWithTitle:nil
                                                     message:@"Account\n\n\n\n\n\n\n\n\n"
                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
    alert.view.backgroundColor = [UIColor grayColor];
    [alert addAction:cancelAction];
    tblAccount = [[UITableView alloc] initWithFrame:(CGRectMake(5,45,260,215))      style:UITableViewStylePlain];
    tblAccount.dataSource = self;
    tblAccount.delegate = self;
    tblAccount.layer.borderWidth = 1.0;
    // [alert setBackgroundColor:[UIColor blueColor]
    
    //  [controller.view setUserInteractionEnabled:YES];
    [tblAccount setUserInteractionEnabled:YES];
    [alert.view addSubview:tblAccount];
    [self presentViewController:alert animated:NO completion:nil];
    //tblDeposit.hidden=NO;
    //[tblDeposit reloadData];
    
    //[self getbankList];
//
//    [txtDeposit resignFirstResponder];
//    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Account:"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:nil,  nil];
//    //[txtCategory becomeFirstResponder];
//    
//    popup.delegate = self;
//    for (NSString *title in arrBankData) {
//        [popup addButtonWithTitle:title];
//    }
//
//    popup.tag = 3;
//    
//    [popup showInView:self.view];
//    [arrBankData removeAllObjects];
    //[arrId removeAllObjects];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==tblCategory) {
        return arrAllData.count;
        
    }else{
    return arrBankData.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    //[cell configUI:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier];
        
    }
    if (tableView==tblCategory) {
        
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

    }
    else{
        
        
        
        UILabel *lblname=[[UILabel alloc]initWithFrame:(CGRectMake(45, 5, 150, 40))];
        lblname.textAlignment = NSTextAlignmentCenter;
        //lblname.text=[arrAllData objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lblname];
//UILabel *lblName=(UILabel *)[cell viewWithTag:11];
    
    lblname.text=[arrBankData objectAtIndex:indexPath.row];
    
    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==tblCategory) {
        _txtCategorySalary.text=[arrAllData objectAtIndex:indexPath.row];
        imgTransaction.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
        NSLog(@"%@",imgTransaction.image);
[alert dismissViewControllerAnimated:YES completion:nil];
    }else{
    txtDeposit.text=[arrBankData objectAtIndex:indexPath.row];
    strid=[arrId objectAtIndex:indexPath.row];
        [alert dismissViewControllerAnimated:YES completion:nil];
        //tblDeposit.hidden=YES;
    }
    
}
@end
