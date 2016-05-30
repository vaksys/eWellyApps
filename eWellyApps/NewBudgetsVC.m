//
//  NewBudgetsVC.m
//  eWellyApps
//
//  Created by Vaksys on 12/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "NewBudgetsVC.h"

@interface NewBudgetsVC ()

@end

@implementation NewBudgetsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarController.tabBar setHidden:YES];
    
   

    [[self txtEndDate] setTintColor:[UIColor clearColor]];
    [txtStartDate setTintColor:[UIColor clearColor]];

    [ txtCategory setTintColor:[UIColor clearColor]];


    _datePicker.hidden=YES;
    _datePicker1.hidden=YES;
    btnSave.layer.cornerRadius = 5;
    CategoryView.hidden=YES;
    CategoryView.layer.cornerRadius=5;
    CategoryView.layer.borderWidth=1;
    CategoryView.layer.borderColor=[UIColor blackColor].CGColor;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    txtAmount.inputAccessoryView = numberToolbar;

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

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    
}
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    _datePicker.hidden=YES;
    _datePicker1.hidden=YES;

}
- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
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
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
    [txtCategory resignFirstResponder];
    [txtStartDate resignFirstResponder];
    [_txtEndDate resignFirstResponder];

    
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
    NSDateFormatter *dateFormat1=[[NSDateFormatter alloc]init];
    // dateFormat.dateStyle=NSDateIntervalFormatterNoStyle
    //;
    [dateFormat1 setDateFormat:@"MMMM dd, yyyy"];
    NSString *str1=[NSString stringWithFormat:@"%@",[dateFormat1  stringFromDate:_datePicker1.date]];
    //assign text to label
    txtStartDate.text=str1;
}
-(void)LabelTitleEnd:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    // dateFormat.dateStyle=NSDateIntervalFormatterNoStyle
    //;
    [dateFormat setDateFormat:@"MMMM dd, yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:_datePicker.date]];
    //assign text to label
    _txtEndDate.text=str;
}

-(void)save:(id)sender
{
    self.navigationItem.rightBarButtonItem=nil;
    [_datePicker removeFromSuperview];
    [_datePicker1 removeFromSuperview];

}

- (IBAction)txtCategoryClicked:(UITextField *)sender {
    [txtCategory resignFirstResponder];
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Category:"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Category1", @"Category2", @"Category3", @"Category4", @"Category5", nil];
    //[txtCategory becomeFirstResponder];
    popup.tag = 1;

    [popup showInView:self.view];
   // CategoryView.hidden=NO;
}
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    
                    break;
                case 1:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];                    break;
                case 2:
                  txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 3:
                  txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];                    break;
                case 4:
                  txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];                    break;
                
                case 5:
                    //txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 6:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 7:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 8:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 9:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                case 10:
                    txtCategory.text=[popup buttonTitleAtIndex:buttonIndex];
                    break;
                
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}
- (IBAction)btnCategoryClicked:(id)sender {
    if ([sender tag] == 11) {
        txtCategory.text=btnC1.titleLabel.text;
    }
    if ([sender tag] == 12) {
        txtCategory.text=btnC2.titleLabel.text;
    }
    if ([sender tag] == 13) {
        txtCategory.text=btnC3.titleLabel.text;
    } if ([sender tag] == 14) {
        txtCategory.text=btnC4.titleLabel.text;
    }
    CategoryView.hidden=YES;
    
 [txtCategory resignFirstResponder];
}

- (IBAction)btnBack:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];

}
- (IBAction)txtStartDateClicked:(UITextField *)sender {
        [txtStartDate resignFirstResponder];
        
        //    _datepicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
        _datePicker1.backgroundColor = [UIColor lightGrayColor];
        
        _datePicker1.datePickerMode=UIDatePickerModeDate;
        _datePicker1.hidden=NO;
        _datePicker1.date=[NSDate date];
        [_datePicker1 addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker1];

    
    }
- (IBAction)txtEndDateClicked:(UITextField *)sender {
        [_txtEndDate resignFirstResponder];
        
        //    _datepicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
        _datePicker.backgroundColor = [UIColor lightGrayColor];
        
        _datePicker.datePickerMode=UIDatePickerModeDate;
        _datePicker.hidden=NO;
        _datePicker.date=[NSDate date];
        [_datePicker addTarget:self action:@selector(LabelTitleEnd:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];

    

    }
//-(void)cancelDatepicker{
//    [txtStartDate resignFirstResponder];
//    txtStartDate.text = @"";
//}
//
//-(void)doneWithDatepicker{
//    NSString *numberFromTheKeyboard = txtStartDate.text;
//    [txtStartDate resignFirstResponder];
//}
//
- (IBAction)btnCamera:(UIButton *)sender {
}
@end
