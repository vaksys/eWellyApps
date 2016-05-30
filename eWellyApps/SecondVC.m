//
//  SecondVC.m
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC
static sqlite3 *database = nil;

@synthesize addButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 25, [UIScreen mainScreen].bounds.size.height - 44 - 85, 60, 60);
    
        
    tblList.dataSource = self;
    tblList.delegate = self;
    
    
    UIImage * buttonImage = [UIImage imageNamed:@"Rectangle3copy_0.png"];
    
    floattingButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [floattingButtons setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [floattingButtons addTarget:self
                         action:@selector(transactionPage)
               forControlEvents:UIControlEventTouchDown];
    floattingButtons.frame = floatFrame;
    
    [self.view addSubview:floattingButtons];
    
    delegate=[UIApplication sharedApplication].delegate;

    

    
    
   
//    [btnAdd setBackgroundImage:[UIImage imageNamed:@"Rectangle3copy_0.png"] forState:UIControlStateHighlighted];

    arrName=[[NSMutableArray alloc]initWithObjects:@"Toys for kids",@"Food from Prisma",@"Books",@"Books", nil];;
    
    arrPrize=[[NSMutableArray alloc]initWithObjects:@"-$55.90",@"-$60.00",@"-$55.90",@"-$60.00", nil];;
    arrDate=[[NSMutableArray alloc]initWithObjects:@"DEC 22 2015 12:20pm",@"DEC 22 2015 12:20pm",@"DEC 22 2015 12:20pm",@"DEC 22 2015 12:20pm", nil];;
   ;
    arrImg=[[NSMutableArray alloc]initWithObjects:@"Layer3_3.png",@"Layer3_1.png",@"Layer3_3.png",@"Layer3_1.png", nil];;
    arrCategory=[[NSMutableArray alloc]initWithObjects:@"SHOPPING",@"GROCERIES",@"SHOPPING",@"GROCERIES", nil];
    arrName1=[[NSMutableArray alloc]initWithObjects:@"Salary", nil];;
    
    arrPrize1=[[NSMutableArray alloc]initWithObjects:@"+$200.00", nil];;
    arrDate1=[[NSMutableArray alloc]initWithObjects:@"DEC 26 2015 12:20pm" , nil];
    ;
    arrImg1=[[NSMutableArray alloc]initWithObjects:@"Layer3_5.png", nil];;
    
    arrCategory1=[[NSMutableArray alloc]initWithObjects:@"SALARY", nil];;
    self.navigationController.navigationBar.hidden=YES;

    segmentedControl1 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"January", @"February",@"March", @"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"]];
    
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);

    segmentedControl1.frame = CGRectMake(0, 60, viewWidth, 60);
    
    segmentedControl1.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl1.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl1.verticalDividerEnabled = YES;
    segmentedControl1.verticalDividerColor = [UIColor colorWithRed:29.0f/255.0f green:67.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
    segmentedControl1.backgroundColor=[UIColor colorWithRed:29.0f/255.0f green:67.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
    segmentedControl1.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    segmentedControl1.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor]};
    
    segmentedControl1.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    segmentedControl1.verticalDividerWidth = 0.0f;
    [segmentedControl1 addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl1];
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:today];
    NSInteger currentMonth = [components month];
    segmentedControl1.selectedSegmentIndex=currentMonth;
    
}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
    
    
    // NSInteger selectedSegment = sender.selectedSegmentIndex;
    if (segmentedControl.selectedSegmentIndex == 0) {
        
        //toggle the correct view to be visible
        
        
    }
    else if (segmentedControl.selectedSegmentIndex == 1){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==2){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex == 3){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==4){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex == 5){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==6){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex == 7){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==8){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex == 9){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==10){
        
        
    }
    else if (segmentedControl.selectedSegmentIndex==11){
        
        
    }
    
    
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0.5;
    }
    else
        return 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.5;
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

static NSString *cellIdetifier = @"Cell";

SectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
    if(cell == nil)
{
    cell = [[SectionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdetifier];
}

    switch (indexPath.section) {
        case 0:
        {
            UILabel *lblDate=(UILabel *)[cell viewWithTag:11];
            lblDate.text=[arrIncomeCategoryExpense objectAtIndex:indexPath.row];
            cell.lblName.text=[arrReasonExpense objectAtIndex:indexPath.row];
            cell.lblDate.text=[arrpamentDateExpense objectAtIndex:indexPath.row];
            cell.lblPrize.text=[arrIncomeExpense objectAtIndex:indexPath.row];
            cell.lblPrize.textColor=[UIColor colorWithRed:203.0f/255.0f green:87.0f/255.0f blue:74.0f/255.0f alpha:.8f];
            //UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            [cell.imgProduct.layer setCornerRadius:cell.imgProduct.bounds.size.width/2];
            cell.imgProduct.clipsToBounds = YES;
            //img.image=[UIImage imageNamed:@"Layer3_3.png"];
            cell.imgProduct.image = [UIImage imageWithData:[arrCategoryImgExpense objectAtIndex:indexPath.row]];
           
        }
            break;
        case 1:{
            
            UILabel *lblDate=(UILabel *)[cell viewWithTag:11];
            lblDate.text=[arrIncomeCategory objectAtIndex:indexPath.row];
        
            cell.lblName.text=[arrReason objectAtIndex:indexPath.row];
            cell.lblDate.text=[arrpamentDate objectAtIndex:indexPath.row];
            cell.lblPrize.text=[arrIncome objectAtIndex:indexPath.row];
            cell.lblPrize.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.8f];
            

            [cell.imgProduct.layer setCornerRadius:cell.imgProduct.bounds.size.width/2];
            cell.imgProduct.clipsToBounds = YES;
            //img.image=[UIImage imageNamed:@"Layer3_3.png"];
            cell.imgProduct.image = [UIImage imageWithData:[arrCategoryImgIncome objectAtIndex:indexPath.row]];
        }
            break;
        default:
            break;
    }
    
   // cell.contentView.backgroundColor=[UIColor clearColor ];
    
    UIView *whiteRoundedCornerView;
    whiteRoundedCornerView=[[UIView alloc]initWithFrame:(CGRectMake(0, 1, 400, 120))];
    
    
   
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
    tblList.contentInset = UIEdgeInsetsMake(0, 0, 1, 0);

        return cell;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    
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

- (IBAction)btnNext:(UIButton *)sender {
   
   }

- (IBAction)btnNextDateClicked:(UIButton *)sender {
   
    
    
    NSDateFormatter *dateFormat;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM d"];
    if (stringFromTime==nil) {
        NSDate *currentDate = [NSDate date];
        
        
       // NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
//        [dateComponents setDay:-7];
//        NSDate *sevenDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
//        NSLog(@"\ncurrentDate: %@\nseven days ago: %@", currentDate, sevenDaysAgo);
        stringFromTime = [dateFormat stringFromDate:currentDate];
        lblStartDate.text=stringFromTime;

    }else{
    
    NSDate *currentDate = [dateFormat dateFromString:lblStartDate.text];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:+7];
    NSDate *sevenDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSLog(@"\ncurrentDate: %@\nseven days ago: %@", currentDate, sevenDaysAgo);
   stringFromTime = [dateFormat stringFromDate:sevenDaysAgo];
    lblStartDate.text=stringFromTime;
    }
    
    
    NSDateFormatter *dateFormat1;
    dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MMM d"];
    NSDate *currentDate1 = [dateFormat1 dateFromString:stringFromTime];
    
    NSDateComponents *dateComponents1 = [[NSDateComponents alloc] init];
    [dateComponents1 setDay:+4];
    NSDate *sevenDaysAgo1 = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents1 toDate:currentDate1 options:0];
    
    NSString *stringFromTime1 = [dateFormat stringFromDate:sevenDaysAgo1];
    
    lblEndDate.text=stringFromTime1;
    
    //Fetch Transaction Data
    [self getTransactionDataIncome];
    [self getTransactionDataExpense];
    [self incomeSumation];
    [self expenseSumation];
    [tblList  reloadData];
    
   // NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:currentDate1];
    NSInteger currentMonth = [components month];
    NSInteger curret=currentMonth-1;

    segmentedControl1.selectedSegmentIndex=curret;
    

}

- (IBAction)btnPreviousDateClicked:(UIButton *)sender {
    
    NSDateFormatter *dateFormat;
    dateFormat = [[NSDateFormatter alloc] init];
     [dateFormat setDateFormat:@"MMM d"];
    NSDate *currentDate = [dateFormat dateFromString:lblEndDate.text];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:-7];
    NSDate *sevenDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSLog(@"\ncurrentDate: %@\nseven days ago: %@", currentDate, sevenDaysAgo);
    NSString *stringFromTime = [dateFormat stringFromDate:sevenDaysAgo];
    lblEndDate.text=stringFromTime;
    
    NSDateFormatter *dateFormat1;
    dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MMM d"];
    NSDate *currentDate1 = [dateFormat1 dateFromString:stringFromTime];
    
    NSDateComponents *dateComponents1 = [[NSDateComponents alloc] init];
    [dateComponents1 setDay:-6];
    NSDate *sevenDaysAgo1 = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents1 toDate:currentDate1 options:0];
    
    NSString *stringFromTime1 = [dateFormat stringFromDate:sevenDaysAgo1];

    lblStartDate.text=stringFromTime1;
    [self getTransactionDataIncome];
    [self getTransactionDataExpense];
    [self incomeSumation];
    [self expenseSumation];

    [tblList  reloadData];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:currentDate1];
    NSInteger currentMonth = [components month];
    NSInteger curret=currentMonth-1;
    
    segmentedControl1.selectedSegmentIndex=curret;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblList]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
}
-(void)transactionPage
{
    TransactionVC *nBVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TransactionVC"];
    [self.navigationController pushViewController:nBVC animated:YES];
}

-(NSMutableArray*)getTransactionDataIncome
{   arrIncome=[[NSMutableArray alloc]init];
     arrReason=[[NSMutableArray alloc]init];
     arrIncomeCategory=[[NSMutableArray alloc]init];
     arrpamentDate=[[NSMutableArray alloc]init];
     arrAmountIncome=[[NSMutableArray alloc]init];
    arrCategoryImgIncome=[[NSMutableArray alloc]init];
    
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        NSString *strIncome=@"Income";
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM TransactionTb WHERE paymentday BETWEEN \"%@\" and \"%@\" and transaction_type= \"%@\" ",lblStartDate.text, lblEndDate.text,strIncome];
        
        
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
                    [arrCategoryImgIncome addObject:imageData];
                
                
                
                char *incomeAmount = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strIncome= [[NSString alloc] initWithUTF8String:incomeAmount];
                
                
                char *incomeReason = (char *) sqlite3_column_text(statement, 2);
                
                
                NSString *strReason= [[NSString alloc] initWithUTF8String:incomeReason];

                
                char *incomeCategory = (char *) sqlite3_column_text(statement, 3);
                
                
                NSString *strCategory= [[NSString alloc] initWithUTF8String:incomeCategory];
                
                
                char *paymentdate = (char *) sqlite3_column_text(statement, 4);
                
                
                NSString *strPaymentDate= [[NSString alloc] initWithUTF8String:paymentdate];
                
                
                
                [arrReason addObject:strReason];
                [arrIncomeCategory addObject:strCategory];
                [arrpamentDate addObject:strPaymentDate];
                [arrAmountIncome addObject:strIncome];
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
{   arrIncomeExpense=[[NSMutableArray alloc]init];
    arrReasonExpense=[[NSMutableArray alloc]init];
    arrIncomeCategoryExpense=[[NSMutableArray alloc]init];
    arrpamentDateExpense=[[NSMutableArray alloc]init];
    arrAmountExpense=[[NSMutableArray alloc]init];
    arrCategoryImgExpense=[[NSMutableArray alloc]init];

    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        NSString *strExpense=@"Expense";
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM TransactionTb WHERE paymentday BETWEEN \"%@\" and \"%@\" and transaction_type= \"%@\"",lblStartDate.text, lblEndDate.text,strExpense];
        
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
                    [arrCategoryImgExpense addObject:imageData];
                

                char *incomeAmount = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strIncome= [[NSString alloc] initWithUTF8String:incomeAmount];
                
                
                char *incomeReason = (char *) sqlite3_column_text(statement, 2);
                
                
                NSString *strReason= [[NSString alloc] initWithUTF8String:incomeReason];
                
                
                char *incomeCategory = (char *) sqlite3_column_text(statement, 3);
                
                
                NSString *strCategory= [[NSString alloc] initWithUTF8String:incomeCategory];
                
                
                char *paymentdate = (char *) sqlite3_column_text(statement, 4);
                
                
                NSString *strPaymentDate= [[NSString alloc] initWithUTF8String:paymentdate];
                
                [arrReasonExpense addObject:strReason];
                [arrIncomeCategoryExpense addObject:strCategory];
                [arrpamentDateExpense addObject:strPaymentDate];
                [arrAmountExpense addObject:strIncome];
                
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
-(void)incomeSumation{
    
    float sum = 0;
    for (float i = 0;i<arrAmountIncome.count; i++){
        float value = [[arrAmountIncome objectAtIndex:i]floatValue]; //you get the number
        sum = sum + value;//you adding values
    }
    NSString *str=@"+$";
    
    NSString* myNewString = [NSString stringWithFormat:@"%.2f", sum];
    lblIncome.text=[str stringByAppendingString:myNewString];
    
    
    
}
-(void)expenseSumation{
    
    float sum = 0;
    for (int i = 0;i<arrAmountExpense.count; i++){
        int value = [[arrAmountExpense objectAtIndex:i]floatValue]; //you get the number
        sum = sum + value;//you adding values
    }
    NSString *str=@"-$";

    NSString* myNewString = [NSString stringWithFormat:@"%.2f", sum];
    lblExpense.text=[str stringByAppendingString:myNewString];
    [self subtraction];
    
    
}
-(void)subtraction{
    
    
    NSString *AmountValues = [lblIncome.text stringByReplacingOccurrencesOfString:@"+$" withString:@""];

    NSString *AmountValues1 = [lblExpense.text stringByReplacingOccurrencesOfString:@"-$" withString:@""];

    
    float income=[AmountValues floatValue];
    float expense=[AmountValues1 floatValue];
    float total;
    
    total=income-expense;
    NSLog(@"%.2f",total);
    
    
    NSString *str=@"$";
    
    NSString* myNewString = [NSString stringWithFormat:@"%.2f", total];
    lblTotalIncomeExpense.text=[str stringByAppendingString:myNewString];
    
}
@end
