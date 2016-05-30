//
//  SettingVC.m
//  eWellyApps
//
//  Created by Vaksys on 17/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "SettingVC.h"

@interface SettingVC ()

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 25, [UIScreen mainScreen].bounds.size.height - 44 - 85, 60, 60);
    UIImage * buttonImage = [UIImage imageNamed:@"Rectangle3copy_0.png"];
    floattingButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [floattingButtons setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    [floattingButtons addTarget:self
                         action:@selector(pagePush:)
               forControlEvents:UIControlEventTouchDown];
    floattingButtons.frame = floatFrame;
  
  //  [self.view addSubview:floattingButtons];
    

//    arrName=[[NSMutableArray alloc]initWithObjects:@"Account",@"Categories",@"Templates",@"User Information",@"General Setting", nil];;
//    arrImg=[[NSMutableArray alloc]initWithObjects:@"Ellipse1copy15.png",@"Ellipse1copy15.png",@"Ellipse1copy15.png",@"Ellipse1copy15.png",@"Ellipse1copy15.png", nil];
    // Do any additional setup after loading the view.
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
            ;
        case 4:
            return 1;
            break;

            
        default:
            break;
    }
    return 1;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
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
            
            lblName.text=@"Accounts";
            
           
            
//            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
//            
            
            break;}
        case 1:
        {
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            img.image=[UIImage imageNamed:@"Layer3_3.png"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=@"Categories";
            
//            
//            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
            
            
            
            
            break;}
        case 2:{
            
            
            UIImageView *img=(UIImageView *)[cell viewWithTag:11];
            img.image=[UIImage imageNamed:@"Layer3_3.png"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UILabel *lblName=(UILabel *)[cell viewWithTag:12];
            
            lblName.text=@"Templates";
            
//            lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
          
            
            
                    break;}
    case 3:{
    
    
    UIImageView *img=(UIImageView *)[cell viewWithTag:11];
    img.image=[UIImage imageNamed:@"Layer3_3.png"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *lblName=(UILabel *)[cell viewWithTag:12];
    
    lblName.text=@"User Information";
//    
//    lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
    
    
    
    
    break;}
   
    case 4:{
    
    
    UIImageView *img=(UIImageView *)[cell viewWithTag:11];
    img.image=[UIImage imageNamed:@"Layer3_3.png"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *lblName=(UILabel *)[cell viewWithTag:12];
    
    lblName.text=@"General Settings";
//    
//    lblName.textColor = [UIColor colorWithRed:102.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:.5f];
    
    
    
    
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
- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];

}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ switch (indexPath.section) {
    case 0:
    {
        AccountVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"AccountVC"];
        [self.navigationController pushViewController:tVC animated:YES];
    }
        break;
    
    case 1:
    {
        CategoryVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"CategoryVC"];
        [self.navigationController pushViewController:tVC animated:YES];
    }
        break;
    case 2:
    {
        TemplateVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TemplateVC"];
        [self.navigationController pushViewController:tVC animated:YES];
    }
        break;
    case 3:
    {
        UserInformationVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"UserInformationVC"];
        [self.navigationController pushViewController:tVC animated:YES];
    }
        break;

    case 4:
    {
        GenaralSettingVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"GenaralSettingVC"];
        [self.navigationController pushViewController:tVC animated:YES];
    }
        break;
        
        
    default:
        break;
}

    
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
-(void)transactionPage
{
    TransactionVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TransactionVC"];
    [self.navigationController pushViewController:tVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
//    if ([aScrollView isEqual:tbl]) {
//        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
//    }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
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

@end
