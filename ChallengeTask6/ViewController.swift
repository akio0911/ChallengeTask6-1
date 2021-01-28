//
//  ViewController.swift
//  ChallengeTask6
//
//  Created by 松島悠人 on 2021/01/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!

    private var answer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction public func didTapButton(_ sender: Any) {
        let sliderValue = Int(slider.value)

        let firstLine: String = {
            if answer == sliderValue {
                return "当たり!"
            } else {
                return "はずれ!"
            }
        }()

        alert(message: "\(firstLine)\nあなたの値\(sliderValue)")
    }

    private func reset() {
        answer = Int.random(in: 0...10000)
        slider.value = 5000
        updateLabel()
    }

    private func updateLabel() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        label.text = numberFormatter.string(from: NSNumber(integerLiteral: answer))
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
            self?.reset()
        }))
        present(alert, animated: true, completion: nil)
    }
}
