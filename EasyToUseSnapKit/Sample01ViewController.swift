//
//  Sample01ViewController.swift
//  EasyToUseSnapKit
//
//  Created by Shun Tedokon on 11/20/16.
//  Copyright © 2016 Shun Tedokon. All rights reserved.
//

import UIKit
import SnapKit

class Sample01ViewController: UIViewController {
    
    var didSetupConstraints: Bool = false
    let labelCenter: UILabel = UILabel()
    let labelTop: UILabel = UILabel()
    let labelRight: UILabel = UILabel()
    let labelBottom: UILabel = UILabel()
    let labelLeft: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() -> Void {
        
        let font: UIFont? = UIFont(name: "Menlo-Bold", size: 15)
        let bgColor: UIColor = UIColor(hue: 0.13, saturation: 0.99, brightness: 1.00, alpha: 1.0)
        let labels: [String: UILabel] = [
            "Center": labelCenter,
            "Top": labelTop,
            "Right": labelRight,
            "Bottom": labelBottom,
            "Left": labelLeft
        ]
        
        for (index, label) in labels.values.enumerated() {
            label.font = font
            label.textAlignment = .center
            label.backgroundColor = bgColor
            label.textColor = .black
            label.text = [String](labels.keys)[index]
            
            view.addSubview(label)
        }
        
        view.backgroundColor = .white
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            labelCenter.snp.makeConstraints({ (make) in
                make.width.equalTo(100)
                make.height.equalTo(100)
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            })
            
            labelTop.snp.makeConstraints({ (make) in
                make.width.height.equalTo(100)
                make.bottom.equalTo(labelCenter.snp.top).offset(-10)
                make.centerX.equalToSuperview()
            })
            
            labelRight.snp.makeConstraints({ (make) in
                make.size.equalTo(100)
                make.top.equalTo(labelCenter)
                make.left.equalTo(labelCenter.snp.right).offset(10)
            })
            
            labelBottom.snp.makeConstraints({ (make) in
                make.size.equalTo(labelCenter)
                make.top.equalTo(labelCenter.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            })
            
            labelLeft.snp.makeConstraints({ (make) in
                make.size.equalTo(labelCenter)
                make.top.equalTo(labelCenter)
                make.right.equalTo(labelCenter.snp.left).offset(-10)
            })
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }

}
