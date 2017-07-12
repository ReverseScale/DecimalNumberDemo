//
//  CalculatorUIViewController.h
//  DecimalNumberDemo
//
//  Created by WhatsXie on 2017/7/11.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSDropdownControls.h"

@interface CalculatorUIViewController : UIViewController
// 基数
@property (weak, nonatomic) IBOutlet UITextField *cardinalNumberTextField;
// 补数
@property (weak, nonatomic) IBOutlet UITextField *complementNumberTextField;
// 运算符
@property (weak, nonatomic) IBOutlet RSDropdownControls *operatorView;
// 结果方式
@property (weak, nonatomic) IBOutlet RSDropdownControls *resultTypeView;
// 运算结果
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end
