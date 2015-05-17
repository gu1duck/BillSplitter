//
//  ViewController.m
//  BillSplitter
//
//  Created by Jeremy Petter on 2015-05-16.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>




@end

@implementation ViewController
//- (IBAction)calculateSplit:(id)sender {
//    NSNumberFormatter* format = [[NSNumberFormatter alloc] init];
//    format.roundingMode = NSRoundBankers;
//    NSDecimalNumber* bill = [NSDecimalNumber decimalNumberWithDecimal:[[format numberFromString:self.billAmountTextField.text] decimalValue]];
//    NSDecimalNumber* people = [[NSDecimalNumber alloc]initWithFloat:self.numberOfPeopleSlider.value];
//    people = [people decimalNumberByRoundingAccordingToBehavior:(short)0];
//    NSDecimalNumber* result = [bill decimalNumberByDividingBy:people];
//    format.numberStyle = NSNumberFormatterCurrencyStyle;
//    self.totalLabel.text = [format stringFromNumber:result];
//    
//    
//}
- (IBAction)sliderChanged:(id)sender {
    [self calculateSplit];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    [self calculateSplit];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) calculateSplit{
    NSNumberFormatter* format = [[NSNumberFormatter alloc] init];
    format.roundingMode = NSRoundBankers;
    NSDecimalNumber* bill = [NSDecimalNumber decimalNumberWithDecimal:[[format numberFromString:self.billAmountTextField.text] decimalValue]];
    NSDecimalNumber* people = [[NSDecimalNumber alloc]initWithFloat:self.numberOfPeopleSlider.value];
    people = [people decimalNumberByRoundingAccordingToBehavior:(short)0];
    self.noPeople.text = [NSString stringWithFormat:@"%@ people", people];
    NSDecimalNumber* tip = [[NSDecimalNumber alloc]initWithFloat:self.tipSlider.value];
    //tip = [tip decimalNumberByRoundingAccordingToBehavior:(short)0];
    NSNumberFormatter* tipFormat = [[NSNumberFormatter alloc] init];
    tipFormat.numberStyle = NSNumberFormatterPercentStyle;
    self.percentTip.text = [[tipFormat stringFromNumber:tip] stringByAppendingString:@" tip"];
    bill = [bill decimalNumberByAdding:[bill decimalNumberByMultiplyingBy:tip]];
    
    NSDecimalNumber* result = [bill decimalNumberByDividingBy:people];
    
    format.numberStyle = NSNumberFormatterCurrencyStyle;
    self.totalLabel.text = [format stringFromNumber:result];
    
}

@end
