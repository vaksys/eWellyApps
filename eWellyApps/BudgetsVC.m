//
//  BudgetsVC.m
//  eWellyApps
//
//  Created by Vaksys on 12/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "BudgetsVC.h"

@interface BudgetsVC ()

@end

@implementation BudgetsVC
@synthesize addButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;

    
     CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 25, [UIScreen mainScreen].bounds.size.height - 44 - 85, 60, 60);
    
    tblBudgets.dataSource = self;
    tblBudgets.delegate = self;
    UIImage * buttonImage = [UIImage imageNamed:@"Rectangle3copy_0.png"];
    
    floattingButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [floattingButtons setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [floattingButtons addTarget:self
                         action:@selector(pagePush:)
               forControlEvents:UIControlEventTouchDown];
    floattingButtons.frame = floatFrame;
    
    [self.view addSubview:floattingButtons];

    
    // Do any additional setup after loading the view.
}
-(IBAction)pagePush:(id)sender{
    NewBudgetsVC *nBVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NewBudgetsVC"];
    [self.navigationController pushViewController:nBVC animated:YES];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
              ;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    return 1;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
            img.image=[UIImage imageNamed:@"Layer3_3.png"];
            
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=@"Bills";
            
            

            UILabel *lblprize=(UILabel *)[cell viewWithTag:14];
          lblprize.text=@"$300.00";
            
            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;
            UILabel *lblDate=(UILabel *)[cell viewWithTag:13];
            lblDate.text=@"Dec 22 2015-Dec 21 2016";

            lblDate.textColor=[UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.3f];;
            lblprize.textColor=[UIColor colorWithRed:355.0f/255.0f green:54.0f/255.0f blue:98.0f/255.0f alpha:.5f];
            
            break;}
        case 1:
        {
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            img.image=[UIImage imageNamed:@"Layer3_1.png"];
            
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=@"Monthly Rent";
            
            UILabel *lblDate=(UILabel *)[cell viewWithTag:13];
            lblDate.text=@"Dec 22 2015-Dec 21 2016";
            
            
            UILabel *lblprize=(UILabel *)[cell viewWithTag:14];
            lblprize.text=@"$200.00";
            
             lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;
            lblDate.textColor=[UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.3f];;
            lblprize.textColor=[UIColor colorWithRed:355.0f/255.0f green:54.0f/255.0f blue:98.0f/255.0f alpha:.5f];

            break;}
        case 2:{
            
          
            UILabel *defaultLbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 14, 100, 21)];
            defaultLbl.text = @"Availabel";
            defaultLbl.backgroundColor = [UIColor clearColor];
            defaultLbl.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;
            [defaultLbl setFont:[UIFont fontWithName:@"Helvetica" size:18]];
            defaultLbl.textAlignment = NSTextAlignmentCenter;

           
            
//            lblName.text=@"Availabel";
//            lblName.textAlignment = NSTextAlignmentCenter;
//
//            
//            
            UILabel *lblprize=(UILabel *)[cell viewWithTag:14];
            lblprize.text=@"$200.00";
//             lblName.textColor=[UIColor colorWithRed:167.0f/255.0f green:25.0f/255.0f blue:77.0f/255.0f alpha:.5f];
            lblprize.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.7f];
            [cell.contentView addSubview:defaultLbl];

            break;}
        case 3:{
            
            UILabel *defaultLbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 14, 100, 21)];
            defaultLbl.text = @"Total";
            defaultLbl.backgroundColor = [UIColor clearColor];
            defaultLbl.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];;            [defaultLbl setFont:[UIFont fontWithName:@"Helvetica" size:18]];
            defaultLbl.textAlignment = NSTextAlignmentCenter;
            
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
//            lblName.text=@"Total";
//            lblName.textAlignment = NSTextAlignmentCenter;

            
            
            UILabel *lblprize=(UILabel *)[cell viewWithTag:14];
            lblprize.text=@"$700.00";
            cell.backgroundColor=[UIColor yellowColor];
             lblName.textColor=[UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
            
            lblprize.textColor=[UIColor colorWithRed:35.0f/255.0f green:111.0f/255.0f blue:37.0f/255.0f alpha:.6f];;
            [cell.contentView addSubview:defaultLbl];

            break;}
            
        default:
            break;
    }
    //UIView *graphWindow=(UIView *)[cell viewWithTag:5000];
    
    //    CKSparkline *sparkline = [[CKSparkline alloc]
    //                              initWithFrame:CGRectMake(0.0, 0.0, graphWindow.frame.size.width, graphWindow.frame.size.height)];
    //
    //    sparkline.data = item.dataPoints;
    //    sparkline.lineColor=[UIColor whiteColor];
    //    sparkline.drawArea=YES;
    //    sparkline.drawPoints=YES;
    //
    //    [graphWindow addSubview:sparkline];
    cell.contentView.layer.borderColor=[UIColor whiteColor].CGColor;
    
    cell.contentView.layer.borderWidth=2;
    cell.contentView.layer.cornerRadius = 5;
    cell.contentView.layer.masksToBounds = YES;
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
    }
    else
        return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, 2.0f);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    //view.backgroundColor=[UIColor blueColor];
    
//    view.backgroundColor = [UIColor colorWithRed:28.0f/255.0f green:65.0f/255.0f blue:116.0f/255.0f alpha:1.0f];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, 2.0f);
    UIView *view = [[UIView alloc] initWithFrame:frame];
//    view.backgroundColor = [UIColor colorWithRed:28.0f/255.0f green:65.0f/255.0f blue:116.0f/255.0f alpha:1.0f];
   // view.backgroundColor=[UIColor blueColor];

    return view;
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
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblBudgets]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
}

- (IBAction)BtnAddClicked:(UIButton *)sender {
    NewBudgetsVC *nBVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NewBudgetsVC"];
    [self.navigationController pushViewController:nBVC animated:YES];
}
@end
