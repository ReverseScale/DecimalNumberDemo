# DecimalNumberDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-30.9MB-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
[![Build Status](https://travis-ci.org/ReverseScale/RSPayAWA.svg?branch=master)](https://travis-ci.org/ReverseScale/RSPayAWA)

[EN](https://github.com/ReverseScale/DecimalNumberDemo) | [中文](https://github.com/ReverseScale/DecimalNumberDemo/blob/master/README_zh.md)

Since Everbright financial management ideas are deeply rooted in people's minds, various financial products are also mushroomed in general. Since the amount involved, the precision of float can not meet the needs of financial computing. However, the use of NSDecimal in OC is too complicated to use. Therefore, Based on the people were encapsulated and demonstrated through a Demo.
(Swift version included reference examples, with UI Oh 😯 ~)

| 1. List Page | 2. Display Page | 3. Display Page | 4.UI Page |
| ------------- | ------------- | ------------- | ------------- |
| ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/11530502.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/11750909.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/4505947.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/96797331.jpg) |
| Building a List Page via storyboard | Values Equal to Calculations | Handling Calculated Values | Swift UI Showcase |

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

