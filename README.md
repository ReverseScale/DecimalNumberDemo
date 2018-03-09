# DecimalNumberDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-30.9MB-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
[![Build Status](https://travis-ci.org/ReverseScale/RSPayAWA.svg?branch=master)](https://travis-ci.org/ReverseScale/RSPayAWA)

[EN](#Requirements) | [中文](#中文说明)

Since Everbright financial management ideas are deeply rooted in people's minds, various financial products are also mushroomed in general. Since the amount involved, the precision of float can not meet the needs of financial computing. However, the use of NSDecimal in OC is too complicated to use. Therefore, Based on the people were encapsulated and demonstrated through a Demo.
(Swift version included reference examples, with UI Oh 😯 ~)

| Name | 1. List Page | 2. Display Page | 3. Display Page | 4.UI Page |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Screenshots | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/61254329.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/99367276.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/36867899.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-21/58376795.jpg) |
| Description | Building a List Page via storyboard | Values Equal to Calculations | Handling Calculated Values | Swift UI Showcase |

## 🚀 Advantage 
* 1. Less file, code concise, high degree of packaging
* 2. Do not rely on any other third-party libraries
* 3. Through a good demo, learning curve is good
* 4. Has a high custom

## 🤖 Requirements 
* iOS 7+
* Xcode 8+


## 🛠 Usage 
### The first step is to introduce header files
```
#import "NSDecimalNumber+Addtion.h"
```
### The second step is simple to use
#### value is equal to the calculation method
```
/* 
 * The parameter value corresponds to the basic operator
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
#### Processes the calculated value
```
/* 
 * The parameter value corresponds to the result processing method
  * 0: == is equal to
  * 1: min = minimum value
  * 2: max = maximum
  * 3: ≈≈ approximately equal to
  * 4: up≈ up approx
  * 5: down≈ down approximation
  * 6: bankers≈ Bankers calculation
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

## ⚖ License

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬 Contributions

* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

---
# 中文说明
自从余额宝理财思想在人们心中根深蒂固，各种理财产品也如雨后春笋一般出现，既然涉及到金额，float的精度一定不能满足金融类计算的需要，但是OC的NSDecimal使用起来有过于复杂，所以在前人的基础上进行了封装，并通过一个Demo展示出来。
(内附 Swift 版引用示例，带 UI 的哦😯~)

## 🎨 测试 UI 什么样子？

| 名称 |1.列表页 |2.展示页 |3.展示页 |4.UI页 |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/61254329.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/99367276.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-12/36867899.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-21/58376795.jpg) |
| 描述 | 通过 storyboard 搭建列表页 | 值等于计算方式 | 处理计算后的值 | Swift 版 UI 展示 |

## 🚀 框架的优势
* 1.文件少，代码简洁，封装程度高
* 2.不依赖任何其他第三方库
* 3.通过良好的Demo展示，学习曲线好
* 4.具备较高自定义性

## 🤖 要求
* iOS 7+
* Xcode 8+


## 🛠 使用方法
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
 * 0: ==       等于
 * 1: min=     最小值
 * 2: max=     最大值
 * 3: ≈≈       约等于
 * 4: up≈      向上约值
 * 5: down≈    向下约值
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


## ⚖ 协议

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
