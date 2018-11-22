
![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-30.9MB-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
[![Build Status](https://travis-ci.org/ReverseScale/RSPayAWA.svg?branch=master)](https://travis-ci.org/ReverseScale/RSPayAWA)

[EN](https://github.com/ReverseScale/DecimalNumberDemo) | [中文](https://github.com/ReverseScale/DecimalNumberDemo/blob/master/README_zh.md)

自从余额宝理财思想在人们心中根深蒂固，各种理财产品也如雨后春笋一般出现，既然涉及到金额，float的精度一定不能满足金融类计算的需要，但是OC的NSDecimal使用起来有过于复杂，所以在前人的基础上进行了封装，并通过一个Demo展示出来。
(内附 Swift 版引用示例，带 UI 的哦😯~)

## 🎨 测试 UI 什么样子？

|1.列表页 |2.展示页 |3.展示页 |4.UI页 |
| ------------- | ------------- | ------------- | ------------- |
| ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/85062598.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/20224916.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/66547467.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/26123470.jpg) |
| 通过 storyboard 搭建列表页 | 值等于计算方式 | 处理计算后的值 | Swift 版 UI 展示 |

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
