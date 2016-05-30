//
//  ViewController.h
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "MainCell.h"
#import "VCFloatingActionButton.h"
#import "TransactionVC.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,VCFloatingActionButtonDelegate,floatMenuDelegate>
{
    NSMutableArray *arrName,*arrPrize,*arrCost,*arrPersontage,*arrImg;
   
    NSMutableArray *arrName1,*arrPrize1,*arrCost1,*arrPersontage1,*arrImg1;
    NSMutableArray *arrData;
    UISlider *loslider;
    UILabel  * label;
    IBOutlet UITableView *tblMenu;
    UIButton *floattingButtons;
    IBOutlet UIButton *btnFloattingButton;
}
-(void)didSelectMenuOptionAtIndex:(NSInteger)row;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) VCFloatingActionButton *addButton;


@end

