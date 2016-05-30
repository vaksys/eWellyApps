//
//  SectionCell.m
//  eWellyApps
//
//  Created by Vaksys on 09/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "SectionCell.h"

@implementation SectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    ;
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
       
        
//        _slider=[[UISlider alloc]initWithFrame:(CGRectMake(25, 15, 70, 30))];
//        [self.contentView addSubview:_slider];
//
//        _lbl=[[UILabel alloc]initWithFrame:(CGRectMake(0, 5, 50, 50))];
//        _lbl.text=@"How";
//        [self.contentView addSubview:_slider];
//
//[self.contentView addSubview:_lbl];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
