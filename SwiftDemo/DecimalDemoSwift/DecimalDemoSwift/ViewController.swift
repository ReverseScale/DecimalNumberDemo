//
//  ViewController.swift
//  DecimalDemoSwift
//
//  Created by WhatsXie on 2017/11/21.
//  Copyright © 2017年 R.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController,RSDropdownControlsDelegate {
    // 基数
    @IBOutlet weak var cardinalNumberTextField: UITextField!
    // 补数
    @IBOutlet weak var complementNumberTextField: UITextField!
    // 运算结果
    @IBOutlet weak var resultLabel: UILabel!
    // 结果方式
    @IBOutlet weak var resultTypeView: RSDropdownControls!
    // 运算符
    @IBOutlet weak var operatorView: RSDropdownControls!
    // 最终输出文本
    @IBOutlet weak var finishedLabel: UILabel!
    // 最终运算符文本
    @IBOutlet weak var operatorLabel: UILabel!
    // 运算符解释
    @IBOutlet weak var operatorTextLabel: UILabel!
    
    var operatorArray = [Any]()
    var resultTypeArray = [Any]()
    var resultTypeTextArray = [Any]()
    var afterIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operatorArray = ["+", "-", "×", "÷"]
        resultTypeArray = ["==", "min=", "max=", "≈≈", "up≈", "down≈", "bankers≈"]
        resultTypeTextArray = ["等于", "最小值", "最大值", "约等于", "向上约值", "向下约值", "Bankers 计算"]

        setupOperatorAndResultType()
    }
    func setupOperatorAndResultType() {
        operatorView.placeholder = "运算符"
        operatorView.listColor = UIColor.white
        operatorView.listArray = operatorArray as! [String]
        operatorView.delegate = self
        
        resultTypeView.placeholder = "结果符"
        resultTypeView.listColor = UIColor.white
        resultTypeView.listArray = resultTypeArray as! [String]
        resultTypeView.maxDropdownCount = 7
        //可选，默认是4行
        resultTypeView.delegate = self
    }
    
    func downSelectedView(_ selectedView: RSDropdownControls, didSelectedAtIndex indexPath: IndexPath) {
        if (cardinalNumberTextField.text == "") || (complementNumberTextField.text == "") {
            setupAlertView()
            return
        }
        if selectedView.isEqual(operatorView) {
            afterIndex = indexPath.row
            resultLabel.text = "\(decimalFunc(withOperatorType: indexPath.row))"
        } else {
            let finishedString = decimalFunc(withNumber: "\(decimalFunc(withOperatorType: afterIndex))", operatorType: indexPath.row)
            resultLabel.text = finishedString
            if finishedString.count <= 6 {
                finishedLabel.text = getSeparatedString(orgStr: finishedString)
            } else {
                finishedLabel.text = "过长"
            }
        }
    }
    
    // 设置提醒窗
    func setupAlertView() {
        let alert = UIAlertController(title: "请先填写数额", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: {(_ action: UIAlertAction) -> Void in
        }))
        present(alert, animated: true)
    }

    // 计算方式
    func decimalFunc(withOperatorType operatorType: Int) -> NSDecimalNumber {
        var resultNumber = NSDecimalNumber(string: "0")
        switch operatorType {
        case 0:
            resultNumber = SNAdd(cardinalNumberTextField.text, complementNumberTextField.text)
        case 1:
            resultNumber = SNSub(cardinalNumberTextField.text, complementNumberTextField.text)
        case 2:
            resultNumber = SNMul(cardinalNumberTextField.text, complementNumberTextField.text)
        default:
            resultNumber = SNDiv(cardinalNumberTextField.text, complementNumberTextField.text)
        }
        return resultNumber
    }
    
    // 计算结果处理方法
    func decimalFunc(withNumber number: String, operatorType: Int) -> String {
        operatorLabel.text = resultTypeArray[operatorType] as? String
        operatorTextLabel.text = resultTypeTextArray[operatorType] as? String
        var resultNumber: String
        switch operatorType {
        case 0:
            resultNumber = number
        case 1:
            resultNumber = "\(SNMin(cardinalNumberTextField.text, complementNumberTextField.text))"
        case 2:
            resultNumber = "\(SNMax(cardinalNumberTextField.text, complementNumberTextField.text))"
        case 3:
            resultNumber = "\(handlerDecimalNumber(number, .plain, 2))"
        case 4:
            resultNumber = "\(handlerDecimalNumber(number, .up, 2))"
        case 5:
            resultNumber = "\(handlerDecimalNumber(number, .down, 2))"
        default:
            resultNumber = "\(handlerDecimalNumber(number, .bankers, 2))"
        }
        return resultNumber
    }
    
    func getSeparatedString(orgStr: String) -> String {
        let length = orgStr.utf16.count
        if length < 4 {
            return orgStr
        }
        var dstStr = String()
        var orgChars = orgStr.characters
        let startIndex = orgChars.startIndex
        var counter = 0
        var i = length - 1
        repeat  {
            counter += 1
            dstStr.insert(orgChars.popLast()!, at: startIndex)
            if counter == 3 {
                dstStr.insert(",", at: startIndex)
                counter = 0;
            }
            i -= 1
        }
        while i > 0
        dstStr.insert(orgChars.popLast()!, at: startIndex)
        return dstStr;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        operatorView.close()
        resultTypeView.close()
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

