//
//  GenaralSettingVC.m
//  eWellyApps
//
//  Created by Vaksys on 18/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "GenaralSettingVC.h"

@interface GenaralSettingVC ()

@end

@implementation GenaralSettingVC
static sqlite3 *database = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
     btnSave.layer.cornerRadius = 5;
    
    picker.backgroundColor= [UIColor lightGrayColor];
    [txtCurrency setTintColor:[UIColor clearColor]];
    picker.hidden=YES;

    curruncyArray  = [NSArray arrayWithObjects:@"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency", @"Currency",  @"Currency",nil];
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    picker.hidden=YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return curruncyArray.count;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [curruncyArray objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    txtCurrency.text=[curruncyArray objectAtIndex:row];
    picker.hidden=YES;
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
    [txtCurrency resignFirstResponder];
    
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
- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
    
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

- (IBAction)txtCurruncyClicked:(UITextField *)sender {
    picker.hidden=NO;

}

- (IBAction)btnBackClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:NO];

}

- (IBAction)btnSave:(UIButton *)sender {
    delegate = [UIApplication sharedApplication].delegate;

    sqlite3_stmt *statement = nil;
    const char *dbpath = [delegate.databasePath UTF8String];
    //    NSInteger intPhoneNo=[strPhone integerValue];
    //    if(sqlite3_open(dbpath, &database) == SQLITE_OK)
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into SettingTb (currency) values (\"%@\")" ,txtCurrency.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL)==SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                //                [ShareSingleTon allocation];
                //                [self getAllData];
                // return YES;
            }
            else
            {
                NSLog(@"error: %s", sqlite3_errmsg(database));
                //return NO;
            }
            
        }
        NSLog(@"error: %s", sqlite3_errmsg(database));
        sqlite3_reset(statement);
    }
    // return NO;
    
    
    

}
@end
