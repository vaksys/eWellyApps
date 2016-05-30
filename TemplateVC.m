//
//  TemplateVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "TemplateVC.h"

@interface TemplateVC ()

@end

@implementation TemplateVC
static sqlite3 *database = nil;



- (void)viewDidLoad {
    [super viewDidLoad];
    delegate=[UIApplication sharedApplication].delegate;

    self.navigationController.navigationBar.hidden=YES;
     CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 25, [UIScreen mainScreen].bounds.size.height - 44 - 85, 60, 60);
    
    
    UIImage * buttonImage = [UIImage imageNamed:@"Rectangle3copy_0.png"];
    
    floattingButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [floattingButtons setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [floattingButtons addTarget:self
                         action:@selector(transactionPage)
               forControlEvents:UIControlEventTouchDown];
    floattingButtons.frame = floatFrame;
    
    [self.view addSubview:floattingButtons];
    tblTemplate.tableFooterView = [[UIView alloc] init] ;

    
    // Do any additional setup after loading the view.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return arrIncomeExpense.count;
            break;
        case 1:
            return arrIncome.count;
            break;
        default:
            break;
    }
    return arrIncomeExpense.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cellID1";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    //[cell configUI:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier];
        
    }
    if (indexPath.section) {
        
    }
    switch (indexPath.section) {
        case 0:{
            
            //            [cell.lblName setBackgroundColor:
            //             [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:[arrImg1 objectAtIndex:0]]]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            [img.layer setCornerRadius:img.bounds.size.width/2]; img.clipsToBounds = YES;
            //img.image=[UIImage imageNamed:@"Layer3_3.png"];
            img.image = [UIImage imageWithData:[arrExpenseImg objectAtIndex:indexPath.row]];
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=[arrReasonExpense objectAtIndex:indexPath.row];
            UILabel *lblSubName=(UILabel *)[cell viewWithTag:13];
            
            lblSubName.text=[arrIncomeCategoryExpense objectAtIndex:indexPath.row];
            UILabel *lblDate=(UILabel *)[cell viewWithTag:14];
            lblDate.text=[arrpamentDateExpense objectAtIndex:indexPath.row];
            
            UILabel *lblprize=(UILabel *)[cell viewWithTag:15];
            lblprize.text=[arrIncomeExpense objectAtIndex:indexPath.row];
            
//            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;
//           
//            
//            lblDate.textColor=[UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.3f];;
            lblprize.textColor=[UIColor colorWithRed:355.0f/255.0f green:54.0f/255.0f blue:98.0f/255.0f alpha:.5f];
            
            break;}
        case 1:
        {
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            [img.layer setCornerRadius:img.bounds.size.width/2]; img.clipsToBounds = YES;
            img.image = [UIImage imageWithData:[arrIncomeImg objectAtIndex:indexPath.row]];
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            lblName.text=[arrReason objectAtIndex:indexPath.row];
            
            
            UILabel *lblSubName=(UILabel *)[cell viewWithTag:13];
            lblSubName.text=[arrIncomeCategory objectAtIndex:indexPath.row];
            
            UILabel *lblDate=(UILabel *)[cell viewWithTag:14];
            lblDate.text=[arrpamentDate objectAtIndex:indexPath.row];
            UILabel *lblprize=(UILabel *)[cell viewWithTag:15];
            lblprize.text=[arrIncome objectAtIndex:indexPath.row];
            
            //            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;
            //
            //
            //            lblDate.textColor=[UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.3f];;
            lblprize.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.7f];
            break;}
                default:
            break;
    }
   
//    cell.contentView.layer.borderColor=[UIColor whiteColor].CGColor;
//    
//    cell.contentView.layer.borderWidth=2;
//    cell.contentView.layer.cornerRadius = 5;
//    cell.contentView.layer.masksToBounds = YES;
    
    UIView *whiteRoundedCornerView;
    whiteRoundedCornerView=[[UIView alloc]initWithFrame:(CGRectMake(0, 2, 400, 120))];
    
    
    
    whiteRoundedCornerView.layer.masksToBounds=YES;
    
    
    whiteRoundedCornerView.layer.shadowOpacity = 1.55;
    
    whiteRoundedCornerView.backgroundColor=[UIColor whiteColor];
    
    
    whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(1, 0);
    //whiteRoundedCornerView.layer.shadowColor=UIColor(red: 53/255.0, green: 143/255.0, blue: 185/255.0, alpha: 1.0).CGColor
    
    
    
    whiteRoundedCornerView.layer.cornerRadius=3.0;
    whiteRoundedCornerView.layer.shadowOffset=CGSizeMake(-1, -1);
    whiteRoundedCornerView.layer.shadowOpacity=0.5;
    [cell.contentView addSubview:whiteRoundedCornerView];
    [ cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    tblTemplate.contentInset = UIEdgeInsetsMake(0, 0, 1, 0);
    
    return cell;
    
}



- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    [self getTransactionDataIncome];
    [self getTransactionDataExpense];
    [tblTemplate reloadData];
    
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
-(void)transactionPage
{
    NewTemplateVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NewTemplateVC"];
    [self.navigationController pushViewController:tVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblTemplate]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
}




-(NSMutableArray*)getTransactionDataIncome

{       [arrIncome removeAllObjects];
        [arrReason removeAllObjects];
        [arrIncomeCategory removeAllObjects];
        [arrpamentDate removeAllObjects];
        [arrAmountIncome removeAllObjects];
        [arrIncomeImg removeAllObjects];
    
    
    arrIncome=[[NSMutableArray alloc]init];
    arrReason=[[NSMutableArray alloc]init];
    arrIncomeCategory=[[NSMutableArray alloc]init];
    arrpamentDate=[[NSMutableArray alloc]init];
    arrAmountIncome=[[NSMutableArray alloc]init];
    arrIncomeImg=[[NSMutableArray alloc]init];
    
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        NSString *strIncome=@"Income";
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM TemplateTb WHERE  transaction_type= \"%@\" ",strIncome];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                int length = sqlite3_column_bytes(statement, 7);
                NSData *imageData = [NSData dataWithBytes:sqlite3_column_blob(statement, 7) length:length];
                
                NSLog(@"Length : %lu", (unsigned long)[imageData length]);
                
                if(imageData == nil)
                    NSLog(@"No image found.");
                else
                    [arrIncomeImg addObject:imageData];
                
                
                

                char *incomeAmount = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strIncome= [[NSString alloc] initWithUTF8String:incomeAmount];
                
                
                char *incomeReason = (char *) sqlite3_column_text(statement, 2);
                
                
                NSString *strReason= [[NSString alloc] initWithUTF8String:incomeReason];
                
                
                char *incomeCategory = (char *) sqlite3_column_text(statement, 3);
                
                
                NSString *strCategory= [[NSString alloc] initWithUTF8String:incomeCategory];
                
                
                char *paymentdate = (char *) sqlite3_column_text(statement, 5);
                
                
                NSString *strPaymentDate= [[NSString alloc] initWithUTF8String:paymentdate];
                
                [arrReason addObject:strReason];
                [arrIncomeCategory addObject:strCategory];
                [arrpamentDate addObject:strPaymentDate];
               // [arrAmountIncome addObject:strIncome];
                NSString *str=@"+$";
                NSString *strprize=[str stringByAppendingString:strIncome];
                
                
                [arrIncome addObject:strprize];
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrIncome;
    
    
    
    
}
-(NSMutableArray*)getTransactionDataExpense

{
    [arrIncomeExpense removeAllObjects];
    [arrReasonExpense removeAllObjects];
    [arrIncomeCategoryExpense removeAllObjects];
    [arrpamentDateExpense removeAllObjects];
    [arrAmountExpense removeAllObjects];
    [arrExpenseImg removeAllObjects];
    
    
    arrIncomeExpense=[[NSMutableArray alloc]init];
    arrReasonExpense=[[NSMutableArray alloc]init];
    arrIncomeCategoryExpense=[[NSMutableArray alloc]init];
    arrpamentDateExpense=[[NSMutableArray alloc]init];
    arrAmountExpense=[[NSMutableArray alloc]init];
    arrExpenseImg =[[NSMutableArray alloc]init];
    
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        NSString *strIncome=@"Expense";
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM TemplateTb WHERE transaction_type= \"%@\" ",strIncome];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                int length = sqlite3_column_bytes(statement, 7);
                NSData *imageData = [NSData dataWithBytes:sqlite3_column_blob(statement, 7) length:length];
                
                NSLog(@"Length : %lu", (unsigned long)[imageData length]);
                
                if(imageData == nil)
                    NSLog(@"No image found.");
                else
                    [arrExpenseImg addObject:imageData];
                

                char *incomeAmount = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strIncome= [[NSString alloc] initWithUTF8String:incomeAmount];
                
                
                char *incomeReason = (char *) sqlite3_column_text(statement, 2);
                
                
                NSString *strReason= [[NSString alloc] initWithUTF8String:incomeReason];
                
                
                char *incomeCategory = (char *) sqlite3_column_text(statement, 3);
                
                
                NSString *strCategory= [[NSString alloc] initWithUTF8String:incomeCategory];
                
                
                char *paymentdate = (char *) sqlite3_column_text(statement, 5);
                
                
                NSString *strPaymentDate= [[NSString alloc] initWithUTF8String:paymentdate];
                
                [arrReasonExpense addObject:strReason];
                [arrIncomeCategoryExpense addObject:strCategory];
                [arrpamentDateExpense addObject:strPaymentDate];
                //[arrAmountExpense addObject:strIncome];
                
                NSString *str=@"-$";
                NSString *strprize=[str stringByAppendingString:strIncome];
                
                
                [arrIncomeExpense addObject:strprize];
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrIncome;
    
    
    
    
}

@end
