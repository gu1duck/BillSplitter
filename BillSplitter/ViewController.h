//
//  ViewController.h
//  BillSplitter
//
//  Created by Jeremy Petter on 2015-05-16.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *noPeople;
@property (weak, nonatomic) IBOutlet UILabel *percentTip;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;


@end

