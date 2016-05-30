//
//  AccountVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "AccountVC.h"

@interface AccountVC ()

@end

@implementation AccountVC
static sqlite3 *database = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    arrCategoryNote=[[NSMutableArray alloc]init];
    arrCategoryType=[[NSMutableArray alloc]init];
    arrCategoryBalance=[[NSMutableArray alloc]init];
    arrCategoryImg=[[NSMutableArray alloc]init];
    
    delegate=[UIApplication sharedApplication].delegate;

    tblAccount.tableFooterView = [[UIView alloc] init] ;

    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return arrCategoryNote.count;
            break;
       
        default:
            break;
    }
    return arrCategoryNote.count;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
            int arr=[[arrCategoryBalance objectAtIndex:indexPath.row]intValue];
            ;
            
            if (arr<0) {
                
                NSString *string = [NSString stringWithFormat:@"%d", arr];
                 NSString *replaceDollerValue = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
                NSString *str=@"-$";
              NSString*  strprize=[str stringByAppendingString:replaceDollerValue];
                
                UIImageView *img=(UIImageView *)[cell viewWithTag:11];
                [img.layer setCornerRadius:img.bounds.size.width/2]; img.clipsToBounds = YES;
                //img.image=[UIImage imageNamed:@"Layer3_3.png"];
                img.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
                UILabel *lblName=(UILabel *)[cell viewWithTag:12];
                
                lblName.text=[arrCategoryType objectAtIndex:indexPath.row];
                
                UILabel *lblBank=(UILabel *)[cell viewWithTag:13];
                lblBank.text=[arrCategoryNote objectAtIndex:indexPath.row];
                
                ;
                UILabel *lblPrize=(UILabel *)[cell viewWithTag:14];
                lblPrize.text=strprize;
                lblPrize.textColor=[UIColor redColor];
                lblPrize.textColor=[UIColor colorWithRed:200.0f/255.0f green:67.0f/255.0f blue:77.0f/255.0f alpha:.9f];

            }else{
                NSString *balancepositive= [NSString stringWithFormat:@"%d", arr];
                NSString *str=@"+$";
             NSString*   strprize=[str stringByAppendingString:balancepositive];
                
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
                [img.layer setCornerRadius:img.bounds.size.width/2]; img.clipsToBounds = YES;
                //img.image=[UIImage imageNamed:@"Layer3_3.png"];
                img.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=[arrCategoryType objectAtIndex:indexPath.row];
            
            UILabel *lblBank=(UILabel *)[cell viewWithTag:13];
            lblBank.text=[arrCategoryNote objectAtIndex:indexPath.row];
            
            ;
            UILabel *lblPrize=(UILabel *)[cell viewWithTag:14];
                lblPrize.text=strprize;
            
            
            
            lblPrize.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.7f];
                
                lblPrize.textColor=[UIColor greenColor];
                
            }
//            lblBank.textColor=[UIColor colorWithRed:355.0f/255.0f green:54.0f/255.0f blue:98.0f/255.0f alpha:.5f];
            
            break;}
              default:
            break;
    }
    UIView *whiteRoundedCornerView;
    whiteRoundedCornerView=[[UIView alloc]initWithFrame:(CGRectMake(0, 2, 400, 120))];
    whiteRoundedCornerView.layer.masksToBounds=YES;
    whiteRoundedCornerView.layer.shadowOpacity = 1.55;
    whiteRoundedCornerView.backgroundColor=[UIColor whiteColor];
    whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(1, 0);
       whiteRoundedCornerView.layer.cornerRadius=3.0;
    whiteRoundedCornerView.layer.shadowOffset=CGSizeMake(-1, -1);
    whiteRoundedCornerView.layer.shadowOpacity=0.5;
    [cell.contentView addSubview:whiteRoundedCornerView];
    [ cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    tblAccount.contentInset = UIEdgeInsetsMake(0, 0, 1, 0);
    

    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    [self getAccountData];
    [tblAccount reloadData];
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
    NewAccountVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NewAccountVC"];
    [self.navigationController pushViewController:tVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblAccount]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
}
-(NSMutableArray*)getAccountData
{
    [arrCategoryNote removeAllObjects];
    [arrCategoryType removeAllObjects];
    [arrCategoryBalance removeAllObjects];
    [arrCategoryNote removeAllObjects];
    [arrCategoryImg removeAllObjects];
    
    sqlite3_stmt *statement = nil;
    if (sqlite3_open([delegate.databasePath UTF8String] , &database) == SQLITE_OK)
    {
        
        NSString *selectAllQuery = [NSString stringWithFormat:@"SELECT * FROM AccountTb"];
        
        if (sqlite3_prepare_v2(database ,[selectAllQuery UTF8String] , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                //imgView.image = [UIImage imageWithData:imageData];
                
                
                int length = sqlite3_column_bytes(statement, 4);
                NSData *imageData = [NSData dataWithBytes:sqlite3_column_blob(statement, 4) length:length];
                
                NSLog(@"Length : %lu", (unsigned long)[imageData length]);
                
                if(imageData == nil)
                    NSLog(@"No image found.");
                else
                    [arrCategoryImg addObject:imageData];
                

                
                char *CNote = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strNote= [[NSString alloc] initWithUTF8String:CNote];
                char *cType = (char *) sqlite3_column_text(statement, 2);
                
                
                NSString *strType= [[NSString alloc] initWithUTF8String:cType];
                char *cBalance = (char *) sqlite3_column_text(statement, 3);
                
                
                NSString *strBalance= [[NSString alloc] initWithUTF8String:cBalance];
                NSString *strprize;
                int balance=[strBalance intValue];
                
                if (balance<0) {
                    NSString *str=@"-$";
                strprize=[str stringByAppendingString:strBalance];
                }else{
                NSString *str=@"+$";
                    strprize=[str stringByAppendingString:strBalance];
                }
                [arrCategoryNote addObject:strNote];
                [arrCategoryType addObject:strType];
                [arrCategoryBalance addObject:strBalance];

            }
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrCategoryNote;

}

@end
