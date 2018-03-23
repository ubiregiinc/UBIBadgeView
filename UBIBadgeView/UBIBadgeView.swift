//
//  UBIBadgeView.swift
//
//  Created by Yuki Yasoshima on 2017/05/24.
//  Copyright © 2017 Ubiregi inc. All rights reserved.
//

import UIKit

@objc(UBIBadgeView)
@IBDesignable
class UBIBadgeView: UIView {
    private let frameView: UIView = UIView()
    private let label = UBIBadgeViewLabel()
    
    enum Alignment {
        case center
        case left
        case right
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(self.frameView)
        self.addSubview(self.label)
        
        self.label.textAlignment = .center
        self.label.font = self.font
        self.label.textColor = self.textColor
        
        self.label.layoutBlock = { [weak self] in
            self?.updateLayout()
        }
        
        self.updateText()
        
        self.frameView.layer.backgroundColor = self.frameBackgroundColor.cgColor
        self.frameView.layer.borderColor = self.frameBorderColor.cgColor
        self.frameView.layer.cornerRadius = self.cornerRadius
        self.frameView.layer.borderWidth = self.borderWidth
    }
    
    var font: UIFont = UIFont(name: "Helvetica-Bold", size: 15.0)! {
        didSet {
            self.label.font = font
            self.label.sizeToFit()
        }
    }
    
    @IBInspectable var textColor: UIColor = .white {
        didSet {
            self.label.textColor = textColor
        }
    }
    
    @IBInspectable var value: Int = 0 {
        didSet {
            self.updateText()
        }
    }
    
    @IBInspectable var frameBackgroundColor: UIColor = .orange {
        didSet {
            self.frameView.layer.backgroundColor = frameBackgroundColor.cgColor
        }
    }
    
    @IBInspectable var frameBorderColor: UIColor = .white {
        didSet {
            self.frameView.layer.borderColor = frameBorderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.5 {
        didSet {
            self.frameView.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            self.frameView.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var minWidth: CGFloat = 23
    
    @IBInspectable var isHiddenIfZero: Bool = false {
        didSet {
            self.updateHiddenSubviews()
        }
    }
    
    var paddingWidth: CGFloat = 14.0
    var paddingHeight: CGFloat = 4.0
    
    var alignment: Alignment = .center {
        didSet {
            self.updateLayout();
        }
    }
    
    private func updateText() {
        if self.value >= 1000 {
            self.label.text = "999+"
        } else {
            self.label.text = String(self.value)
        }
        self.label.sizeToFit()
        self.updateHiddenSubviews()
    }
    
    private func updateLayout() {
        let labelSize = self.label.frame.size;
        let frameSize = CGSize(width: max(labelSize.width + self.paddingWidth, self.minWidth), height: labelSize.height + self.paddingHeight)
        self.frameView.frame.size = frameSize
        
        let center = self.convert(self.center, from: self.superview)
        
        switch self.alignment {
        case .center:
            self.frameView.center = center
            self.label.center = center
        case .left:
            let position = CGPoint(x: round(center.x + frameSize.width * 0.5), y: center.y)
            self.frameView.center = position
            self.label.center = position
        case .right:
            let position = CGPoint(x: round(center.x - frameSize.width * 0.5), y: center.y)
            self.frameView.center = position
            self.label.center = position
        }
    }
    
    private func updateHiddenSubviews() {
        if self.isHiddenIfZero && self.value == 0 {
            self.frameView.isHidden = true
            self.label.isHidden = true
        } else {
            self.frameView.isHidden = false
            self.label.isHidden = false
        }
    }
}

class UBIBadgeViewLabel: UILabel {
    var layoutBlock: (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let block = self.layoutBlock {
            block()
        }
    }
}
