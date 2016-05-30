//
//  ViewController.m
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize addButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBarController.tabBar setHidden:NO];
    
    VCFloatingActionButton *categoryTableViewInstance = [[VCFloatingActionButton alloc] init];
    [categoryTableViewInstance setDelegate:self];

     CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 25, [UIScreen mainScreen].bounds.size.height - 44 - 85, 60, 60);
    
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"Rectangle3copy_0.png"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:tblMenu];
    
    //    NSDictionary *optionsDictionary = @{@"fb-icon":@"Facebook",@"twitter-icon":@"Twitter",@"google-icon":@"Google Plus",@"linkedin-icon":@"Linked in"};
    //    addButton.menuItemSet = optionsDictionary;
    
    //floattingButtons=[[UIButton alloc]initWithFrame:floatFrame];
    
    
    addButton.imageArray = @[@"TransactionIcon"];
    addButton.labelArray = @[@"Transaction"];
    
    addButton.hideWhileScrolling = YES;
    addButton.delegate = self;
    
    tblMenu.dataSource = self;
    tblMenu.delegate = self;
    
    
    UIImage * buttonImage = [UIImage imageNamed:@"Rectangle3copy_0.png"];

    floattingButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [floattingButtons setBackgroundImage:buttonImage forState:UIControlStateNormal];

    [floattingButtons addTarget:self
               action:@selector(transactionPage)
     forControlEvents:UIControlEventTouchDown];
    floattingButtons.frame = floatFrame;
    
    [self.view addSubview:floattingButtons];

    
    
    
    
    self.navigationController.navigationBar.hidden=YES;
   // tblMenu.backgroundColor=[UIColor colorWithRed:179.0f/255.0f green:64.0f/255.0f blue:64.0f/255.0f alpha:1.0f];
    
    arrName=[[NSMutableArray alloc]initWithObjects:@"BALANCE",@"SPENDING",@"EXPECTED SAVING",@"BUDGETS", nil];;
    
    arrPrize=[[NSMutableArray alloc]initWithObjects:@"+$2200.00",@"-$555.90",@"-$55.90",@"$700.00", nil];;
    arrCost=[[NSMutableArray alloc]initWithObjects:@"+$200.00",@"+$100.00",@"+$100.00",@"$300.00", nil];;
    arrPersontage=[[NSMutableArray alloc]initWithObjects:@"+15%",@"+15%",@"+15%",@"+15%", nil];;
    arrImg=[[NSMutableArray alloc]initWithObjects:@"Ellipse1copy15.png",@"Ellipse1copy15.png",@"Ellipse1copy15.png",@"Ellipse1copy15.png", nil];
    
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    HMSegmentedControl *segmentedControl1 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"January", @"February",@"March", @"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"]];
  

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
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:today];
    NSInteger currentMonth = [components month];
    segmentedControl1.selectedSegmentIndex=currentMonth;
    
    // this will give you the integer for the month number
    
    //    [components setMonth:1];
    //    NSDate *newDate = [gregorian dateByAddingComponents:components toDate:today options:0];
    //    NSDateComponents *nextComponents = [gregorian components:NSMonthCalendarUnit fromDate:newDate];
    //    

    
    
    [self.view addSubview:segmentedControl1];
    
    
    
    
    tblMenu.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tblMenu = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    [tblMenu setDelegate:self];
    [tblMenu setDataSource:self];
    [tblMenu setSeparatorStyle: UITableViewCellSeparatorStyleSingleLine];
    [tblMenu setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)]];
    tblMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    v.backgroundColor = [UIColor clearColor];
    [tblMenu setTableFooterView:v];
    tblMenu.layer.borderWidth = 2;
    tblMenu.layer.cornerRadius = 10;
    tblMenu.layer.borderWidth=3;
    tblMenu.layer.cornerRadius=5;
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    if ([aScrollView isEqual:tblMenu]) {
        floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
                                                                         }
    floattingButtons.transform = CGAffineTransformMakeTranslation(0, aScrollView.contentOffset.y);
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
- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];

    CGRect frame = tblMenu.tableHeaderView.frame;
    frame.size.height = 1;
    UIView *headerView = [[UIView alloc] initWithFrame:frame];
    [tblMenu setTableHeaderView:headerView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
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
   
    MainCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    [cell configUI:indexPath];
    cell.layer.cornerRadius = 5;

    if (cell==nil) {
        cell=[[MainCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier];
        
    }
    if (indexPath.section) {
        
    }
    switch (indexPath.section) {
        case 0:
            
//            [cell.lblName setBackgroundColor:
//             [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:[arrImg1 objectAtIndex:0]]]];
            cell.lblName.text=[arrName objectAtIndex:0];
            cell.lblPrize.text=[arrPrize objectAtIndex:0];
            
            cell.lblcost.text=[arrCost objectAtIndex:0];
            cell.lblPersontage.text=[arrPersontage objectAtIndex:0];
            cell.imgChart.image=[UIImage imageNamed:[arrImg objectAtIndex:0]];
            cell.lblPrize.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.7f];
            cell.lblcost.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];
            cell.lblPersontage.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];;
           

            
            break;
        case 1:
            
            cell.lblName.text=[arrName objectAtIndex:1];
            cell.lblPrize.text=[arrPrize objectAtIndex:1];
            cell.lblcost.text=[arrCost objectAtIndex:1];
            cell.lblPersontage.text=[arrPersontage objectAtIndex:1];
            cell.imgChart.image=[UIImage imageNamed:[arrImg objectAtIndex:1]];
            cell.lblPrize.textColor=[UIColor colorWithRed:203.0f/255.0f green:87.0f/255.0f blue:74.0f/255.0f alpha:.7f];
            cell.lblcost.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];
            cell.lblPersontage.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];
            break;
        case 2:
            cell.lblName.text=[arrName objectAtIndex:2];
            cell.lblPrize.text=[arrPrize objectAtIndex:2];
            cell.lblcost.text=[arrCost objectAtIndex:2];
            cell.lblPersontage.text=[arrPersontage objectAtIndex:2];
            cell.imgChart.image=[UIImage imageNamed:[arrImg objectAtIndex:2]];
            cell.lblPrize.textColor=[UIColor colorWithRed:203.0f/255.0f green:87.0f/255.0f blue:74.0f/255.0f alpha:.7f];
            cell.lblcost.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];
            cell.lblPersontage.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.5f];
            break;
        case 3:
        {
            loslider=[[UISlider alloc]initWithFrame:CGRectMake(40, 10, 200, 80)];
           // [loslider setBackgroundColor:[UIColor greenColor]];

            [loslider addTarget:self action:@selector(sliderAction:)  forControlEvents:UIControlEventValueChanged];
            
            [loslider setMaximumValue:1000.0];
            [loslider setMinimumValue:1.0];
            [loslider setValue:0.9];
            [loslider setMinimumTrackTintColor:[UIColor blueColor]];
            [loslider setMaximumTrackTintColor:[UIColor greenColor]];
            //[loslider setTintColor:[UIColor blueColor]];
            UIImage *sliderLeftTrackImage = [[UIImage imageNamed: @"Layer4copy2.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
            UIImage *sliderRightTrackImage = [[UIImage imageNamed: @"Layer4copy2.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
            [loslider setMinimumTrackImage: sliderLeftTrackImage forState: UIControlStateNormal];
            [loslider setMaximumTrackImage: sliderRightTrackImage forState: UIControlStateNormal];
            [loslider setThumbImage:[UIImage imageNamed:@"Layer3_9.png"] forState:UIControlStateNormal];

            [cell.contentView addSubview:loslider];
           

             label = [[UILabel alloc] initWithFrame:CGRectMake(65, 10, 250, 40)];
            //label.backgroundColor = [UIColor clearColor];
            label.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            label.textColor=[UIColor whiteColor];
            //label.text = @"$200.00";
            label.textColor=[UIColor colorWithRed:67.0f/255.0f green:240.0f/255.0f blue:2.0f/255.0f alpha:.7f];
            [cell.contentView addSubview:label];
            UILabel  * labels = [[UILabel alloc] initWithFrame:CGRectMake(60, 50, 200, 40)];
            //labels.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
            labels.text = @"$300.00";
            labels.textColor=[UIColor colorWithRed:190.0f/255.0f green:67.0f/255.0f blue:50.0f/255.0f alpha:.5f];
            [cell.contentView addSubview:labels];

            
            cell.lblName.text=[arrName objectAtIndex:3];
            cell.lblPrize.text=[arrPrize objectAtIndex:3];
//            cell.lblcost.text=[arrCost objectAtIndex:indexPath.row];
            cell.lblPrize.textColor=[UIColor colorWithRed:203.0f/255.0f green:87.0f/255.0f blue:74.0f/255.0f alpha:1.0f];
            
            
        }
            
            
//            cell.lblPersontage.text=[arrPersontage1 objectAtIndex:indexPath.row];
//            cell.imgChart.image=[UIImage imageNamed:[arrImg1 objectAtIndex:indexPath.row]];
            break;
        default:
            break;
    }
   
   
//    cell.contentView.layer.cornerRadius = 25;
//
//  //  cell.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
//   // cell.contentView.layer.borderWidth = 2.0f;
//    cell.contentView.layer.masksToBounds = YES;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    [tblMenu.layer setCornerRadius:10.0];
    return cell;
    
}
-(void)sliderAction:(id)sender
{
    
    loslider.value = round(loslider.value);

     label.text=[NSString stringWithFormat:@"%f",loslider.value];
    //-- Do further actions
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {

        return 35;
    }
    else
        return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, 2.0f);
    UIView *view = [[UIView alloc] initWithFrame:frame];
//    view.backgroundColor = [UIColor colorWithRed:28.0f/255.0f green:65.0f/255.0f blue:116.0f/255.0f alpha:1.0f];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, 2.0f);
    UIView *view = [[UIView alloc] initWithFrame:frame];
//    view.backgroundColor = [UIColor colorWithRed:179.0f/255.0f green:64.0f/255.0f blue:64.0f/255.0f alpha:1.0f];
    return view;
}

-(void)transactionPage
{
    TransactionVC *tVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TransactionVC"];
    [self.navigationController pushViewController:tVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
