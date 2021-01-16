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

    @IBAction func didTapButton(_ sender: Any) {
        let value = Int(slider.value)
        print(value)

        if label.text == "\(value)" {
            self.alert(message: "当たり!\nあなたの値\(value)")
        } else {
            self.alert(message: "はずれ!\n あなたの値\(value)")
        }
    }

    private func reset() {
        slider.value = 50
        let number = arc4random_uniform(100)
        label.text = "\(number)"
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { (  _) in
            self.reset()
        }))
        present(alert, animated: true, completion: nil)        
    }
}
