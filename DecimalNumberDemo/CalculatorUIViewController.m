//
//  CalculatorUIViewController.m
//  DecimalNumberDemo
//
//  Created by WhatsXie on 2017/7/11.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "CalculatorUIViewController.h"
#import "NSDecimalNumber+Addtion.h"


@interface CalculatorUIViewController ()<RSDropdownControlsDelegate>
@property (nonatomic, strong)NSArray *operatorArray;
@property (nonatomic, strong)NSArray *resultTypeArray;
@property (nonatomic, assign)NSInteger afterIndex;
@end

@implementation CalculatorUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.operatorArray = @[@"+", @"-", @"×", @"÷"];
    self.resultTypeArray = @[@"==", @"min=", @"max=", @"≈≈", @"up≈", @"down≈", @"bankers≈"];
    
    [self setupOperatorAndResultType];
}
- (void)setupOperatorAndResultType {
    _operatorView.placeholder = @"运算符";
    _operatorView.listArray = _operatorArray;
    _operatorView.delegate = self;
    
    _resultTypeView.placeholder = @"结果符";
    _resultTypeView.listArray = _resultTypeArray;
    _resultTypeView.maxDropdownCount = 7; //可选，默认是4行
    _resultTypeView.delegate = self;
}

- (void)downSelectedView:(RSDropdownControls *)selectedView didSelectedAtIndex:(NSIndexPath *)indexPath {
    if ([_cardinalNumberTextField.text isEqualToString:@""] || [_complementNumberTextField.text isEqualToString:@""]) {
        [self setupAlertView];
        return;
    }
    if ([selectedView isEqual:_operatorView]) {
        _afterIndex = indexPath.row;
        _resultLabel.text = [NSString stringWithFormat:@"%@", [self DecimalFuncWithOperatorType:indexPath.row]];
    } else {
        _resultLabel.text = [self DecimalFuncWithNumber:[NSString stringWithFormat:@"%@", [self DecimalFuncWithOperatorType:_afterIndex]] operatorType:indexPath.row];
    }
}
// 设置提醒窗
- (void)setupAlertView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请先填写数额" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
// 计算方式
- (NSDecimalNumber *)DecimalFuncWithOperatorType:(NSInteger)operatorType {
    NSDecimalNumber *resultNumber = [[NSDecimalNumber alloc]initWithString:@"0"];
    switch (operatorType) {
        case 0:
            resultNumber = SNAdd(_cardinalNumberTextField.text, _complementNumberTextField.text);
            break;
        case 1:
            resultNumber = SNSub(_cardinalNumberTextField.text, _complementNumberTextField.text);
            break;
        case 2:
            resultNumber = SNMul(_cardinalNumberTextField.text, _complementNumberTextField.text);
            break;
        case 3:
            resultNumber = SNDiv(_cardinalNumberTextField.text, _complementNumberTextField.text);
            break;
    }
    return resultNumber;
}
// 计算结果处理方法
- (NSString *)DecimalFuncWithNumber:(NSString *)number operatorType:(NSInteger)operatorType {
    NSString *resultNumber;
    switch (operatorType) {
        case 0:
            resultNumber = number;
            break;
        case 1:
            resultNumber = [NSString stringWithFormat:@"%@", SNMin(_cardinalNumberTextField.text, _complementNumberTextField.text)];
            break;
        case 2:
            resultNumber = [NSString stringWithFormat:@"%@", SNMax(_cardinalNumberTextField.text, _complementNumberTextField.text)];
            break;
        case 3:
            resultNumber = [NSString stringWithFormat:@"%@", handlerDecimalNumber(number, NSRoundPlain, 2)];
            break;
        case 4:
            resultNumber = [NSString stringWithFormat:@"%@", handlerDecimalNumber(number, NSRoundUp, 2)];
            break;
        case 5:
            resultNumber = [NSString stringWithFormat:@"%@", handlerDecimalNumber(number, NSRoundDown, 2)];
            break;
        case 6:
            resultNumber = [NSString stringWithFormat:@"%@", handlerDecimalNumber(number, NSRoundBankers, 2)];
            break;
    }
    return resultNumber;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_operatorView close];
    [_resultTypeView close];
    [self.view endEditing:YES];
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

@end
