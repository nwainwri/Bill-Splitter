//
//  ViewController.m
//  Bill Splitter
//
//  Created by Nathan Wainwright on 2018-08-11.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalBillAmount;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleForBill;
@property (weak, nonatomic) IBOutlet UILabel *portionForEachPerson;
@property (weak, nonatomic) IBOutlet UIButton *calculateBillPortionsPressed;

- (IBAction)calculateSplitAmount:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.portionForEachPerson.text = @"9.99";
//     Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sliderValueChanged:(id)sender {
    //below code ensures slider only uses full int's
    // http://iphonedevsdk.com/forum/iphone-sdk-development/81746-how-to-show-integer-values-for-ui-slider.html
    UISlider *slider = (UISlider *)sender;
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", (int)slider.value];
    self.portionForEachPerson.text = newText;
}



- (IBAction)calculateSplitAmount:(id)sender{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.locale = [NSLocale currentLocale];// this ensures the right separator behavior
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    [numberFormatter setMaximumFractionDigits:2];
    numberFormatter.usesGroupingSeparator = YES;
    

    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:self.numberOfPeopleForBill.value];
    NSDecimalNumber *totalBill = [[NSDecimalNumber alloc] initWithString:self.totalBillAmount.text];

    
    //totalBill = [self.totalBillAmount.text intValue];
    
    totalBill = [totalBill decimalNumberByDividingBy:numberOfPeople];
//    self.totalBillAmount.text = [NSNumberFormatter totalBill];
//    self.totalBillAmount.text = [NSString stringWithFormat:@"%.02@", totalBill ];
    
    self.totalBillAmount.text = [NSString stringWithFormat:@"%@", [numberFormatter stringForObjectValue:totalBill]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
