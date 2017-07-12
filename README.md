# DecimalNumberDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-1MB-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

自从余额宝理财思想在人们心中根深蒂固，各种理财产品也如雨后春笋一般出现，既然涉及到金额，float的精度一定不能满足金融类计算的需要，但是OC的NSDecimal使用起来有过于复杂，所以在前人的基础上进行了封装，并通过一个Demo展示出来。

| 名称 |1.列表页 |2.展示页 |3.展示页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/61254329.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/99367276.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/36867899.jpg) |
| 描述 | 通过 storyboard 搭建列表页 | 值等于计算方式 | 处理计算后的值 |


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
```
#import "NSDecimalNumber+Addtion.h"
```
### 第二步 简单使用
#### 值等于计算方式
```
/* 
 * 参数值对应基本运算符
 * 0: +
 * 1: -
 * 2: ×
 * 3: ÷
 */
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
```
#### 处理计算后的值
```
/* 
 * 参数值对应结果处理方式
 * 0: ==       等于
 * 1: min=     最小值
 * 2: max=     最大值
 * 3: ≈≈       约等于
 * 4: up≈      向上约值
 * 5: down≈    向下约值
 * 6: bankers≈ Bankers计算
 */
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
```
使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
DecimalNumberDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
