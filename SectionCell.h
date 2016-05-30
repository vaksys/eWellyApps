//
//  SectionCell.h
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblPrize;
@property (strong, nonatomic) UISlider *slider;
@property (strong, nonatomic)  UILabel *lbl;

@end
