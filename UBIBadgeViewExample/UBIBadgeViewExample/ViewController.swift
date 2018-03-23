//
//  ViewController.swift
//  UBIBadgeViewExample
//
//  Created by Yuki Yasoshima on 2018/03/23.
//  Copyright © 2018 Ubiregi inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var centerAlignedBadge: UBIBadgeView!
    @IBOutlet weak var leftAlignedBadge: UBIBadgeView!
    @IBOutlet weak var rightAlignedBadge: UBIBadgeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.centerAlignedBadge.alignment = .center
        self.leftAlignedBadge.alignment = .left
        self.rightAlignedBadge.alignment = .right
    }

    @IBAction func textFieldEditingChanged(_ sender: AnyObject) {
        guard let textField = sender as? UITextField else {
            return
        }
        
        let value = Int(textField.text ?? "0") ?? 0
        
        self.centerAlignedBadge.value = value
        self.leftAlignedBadge.value = value
        self.rightAlignedBadge.value = value
    }
}

