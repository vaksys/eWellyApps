//
//  MainCell.h
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUChart.h"
@interface MainCell : UITableViewCell<UUChartDataSource>
{
    NSIndexPath *path;
    UUChart *chartView;
}
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblPrize;
@property (strong, nonatomic) IBOutlet UILabel *lblcost;
@property (strong, nonatomic) IBOutlet UILabel *lblPersontage;
@property (strong, nonatomic) IBOutlet UIImageView *imgChart;
@property (strong, nonatomic) IBOutlet UIView *chartView;
- (void)configUI:(NSIndexPath *)indexPath;


@end
