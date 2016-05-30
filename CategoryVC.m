//
//  CategoryVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "CategoryVC.h"

@interface CategoryVC ()

@end

@implementation CategoryVC
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
    arrCategoryName=[[NSMutableArray alloc]init];
    arrCategoryImg=[[NSMutableArray alloc]init];
    tblCategory.tableFooterView = [[UIView alloc] init] ;


    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return arrCategoryName.count;
            break;
        
            
        default:
            break;
    }
    return arrCategoryName.count;
    
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
            
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
             [img.layer setCornerRadius:img.bounds.size.width/2]; img.clipsToBounds = YES;
            //img.image=[UIImage imageNamed:@"Layer3_3.png"];
            img.image = [UIImage imageWithData:[arrCategoryImg objectAtIndex:indexPath.row]];
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=[arrCategoryName objectAtIndex:indexPath.row];
            
            
//            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
//            
           
            
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
    //whiteRoundedCornerView.layer.shadowColor=UIColor(red: 53/255.0, green: 143/255.0, blue: 185/255.0, alpha: 1.0).CGColor
    
    
    
    whiteRoundedCornerView.layer.cornerRadius=3.0;
    whiteRoundedCornerView.layer.shadowOffset=CGSizeMake(-1, -1);
    whiteRoundedCornerView.layer.shadowOpacity=0.5;
    [cell.contentView addSubview:whiteRoundedCornerView];
    [ cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    tblCategory.contentInset = UIEdgeInsetsMake(0, 0, 1, 0);
    

    
       return cell;
    
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
- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    
    [self getAllData];

    [tblCategory reloadData];
    
    
}
- (IBAction)btnBackClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];

}
-(void)transactionPage
{
    NewCategoryVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NewCategoryVC"];
    [self.navigationController pushViewController:tVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblCategory]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
}
-(NSMutableArray*)getAllData
{   [arrCategoryName removeAllObjects];
    [arrCategoryImg removeAllObjects];
    //arrAllData=[[NSMutableArray alloc]init];
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
                
                    //imgView.image = [UIImage imageWithData:imageData];
                char *cName = (char *) sqlite3_column_text(statement, 1);
                
                
                NSString *strName= [[NSString alloc] initWithUTF8String:cName];
                
                [arrCategoryName addObject:strName];
            }
            
            sqlite3_finalize(statement);
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
    }
    return arrCategoryName;
}

@end
