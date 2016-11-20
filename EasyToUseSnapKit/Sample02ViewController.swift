//
//  Sample02ViewController.swift
//  EasyToUseSnapKit
//
//  Created by Shun Tedokon on 11/20/16.
//  Copyright © 2016 Shun Tedokon. All rights reserved.
//

import UIKit
import SnapKit

class Sample02ViewController: UIViewController {
    
    var didSetupConstraints: Bool = false
    let container: UIView = UIView()
    let labelFullWidth: UILabel = UILabel()
    let labelHalfWidth: UILabel = UILabel()
    let labelQuarter: UILabel = UILabel()
    let label80Percent: UILabel = UILabel()
    let label20Percent: UILabel = UILabel()
    let label40Percent: UILabel = UILabel()
    let label10Percent: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() -> Void {
        
        typealias Content = (title: String, label: UILabel, color: UIColor)
        
        let font: UIFont? = UIFont(name: "Menlo-Bold", size: 15)
        
        let green: UIColor = UIColor(hue: 0.40, saturation: 0.77, brightness: 0.80, alpha: 1.0)
        let yellow: UIColor = UIColor(hue: 0.13, saturation: 0.99, brightness: 1.00, alpha: 1.0)
        let blue: UIColor = UIColor(hue: 0.57, saturation: 0.76, brightness: 0.86, alpha: 1.0)
        let purple: UIColor = UIColor(hue: 0.70, saturation: 0.52, brightness: 0.77, alpha: 1.0)
        let red: UIColor = UIColor(hue: 0.02, saturation: 0.74, brightness: 0.91, alpha: 0.91)
        let pink: UIColor = UIColor(hue: 0.90, saturation: 0.49, brightness: 0.96, alpha: 1.0)
        let navy: UIColor = UIColor(hue: 0.12, saturation: 0.25, brightness: 0.94, alpha: 1.0)
        
        let contents: [Content] = [
            ("100%", labelFullWidth, green),
            ("50%", labelHalfWidth, yellow),
            ("1/4", labelQuarter, blue),
            ("80%", label80Percent, purple),
            ("20%", label20Percent, red),
            ("40%", label40Percent, pink),
            ("10%", label10Percent, navy),
        ]
        
        for content in contents {
            let label = content.label
            label.font = font
            label.textAlignment = .center
            label.backgroundColor = content.color
            label.textColor = .black
            label.layer.opacity = 0.9
            label.text = content.title
            
            container.addSubview(label)
        }
        
        view.addSubview(container)
        view.backgroundColor = .white
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            
            container.snp.makeConstraints({ (make) in
                make.edges.equalToSuperview().inset(UIEdgeInsetsMake(30, 30, 30, 30))
                make.center.equalToSuperview()
            })
            
            labelFullWidth.snp.makeConstraints({ (make) in
                make.width.equalToSuperview()
                make.height.equalTo(100)
                make.top.equalTo(view.snp.centerY)
                make.left.equalToSuperview()
            })
            
            labelHalfWidth.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(100)
                make.bottom.equalTo(view.snp.centerY)
                make.left.equalToSuperview()
            })
            
            labelQuarter.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().dividedBy(2)
                make.height.equalToSuperview().dividedBy(2)
                make.bottom.equalTo(view.snp.centerY)
                make.left.equalTo(view.snp.centerX)
            })
            
            label80Percent.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().multipliedBy(0.8)
                make.top.equalTo(labelFullWidth.snp.bottom)
                make.bottom.equalToSuperview()
                make.right.equalToSuperview()
            })
            
            label20Percent.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().multipliedBy(0.2)
                make.height.equalTo(label80Percent)
                make.top.equalTo(labelFullWidth.snp.bottom)
                make.left.equalToSuperview()
            })
            
            label40Percent.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().multipliedBy(0.4)
                make.top.equalToSuperview()
                make.left.equalToSuperview()
                make.bottom.equalTo(labelHalfWidth.snp.top)
            })
            
            label10Percent.snp.makeConstraints({ (make) in
                make.width.equalToSuperview().multipliedBy(0.1)
                make.top.equalToSuperview()
                make.left.equalTo(label40Percent.snp.right)
                make.bottom.equalTo(labelHalfWidth.snp.top)
            })
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }

}
