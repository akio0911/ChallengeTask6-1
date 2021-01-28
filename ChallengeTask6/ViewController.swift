//
//  ViewController.swift
//  ChallengeTask6
//
//  Created by 松島悠人 on 2021/01/13.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reset()
    }
    @IBAction public func didTapButton(_ sender: Any) {
        let value = Int(slider.value)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        let result = numberFormatter.string(from: NSNumber(integerLiteral: value))
        if label.text == "\(result ?? "")" {
            self.alert(message: "当たり!\nあなたの値\(result ?? "")")
        } else {
            self.alert(message: "はずれ!\n あなたの値\(result ?? "")")
        }
    }
    private func reset() {
        slider.value = 5000
        let number = arc4random_uniform(10000)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        let result = numberFormatter.string(from: NSNumber(integerLiteral: Int(number)))
        label.text = "\(result ?? "")"
    }
    private func alert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { (  _) in
            self.reset()
        }))
        present(alert, animated: true, completion: nil)
    }
}
