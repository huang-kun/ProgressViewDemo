//
//  ProgressView.swift
//  ProgressViewDemo
//
//  Created by huangkun on 2019/4/13.
//  Copyright © 2019 huangkun. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private var progressBackgroundView: UIView!
    private var progressContentView: UIView!
    
    private var backLabel: UILabel!
    private var frontLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgColor = UIColor.white
        let progressColor = UIColor(red: 0.353, green: 0.565, blue: 0.863, alpha: 1.0)
        
        backgroundColor = bgColor
        layer.borderColor = progressColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
        
        progressBackgroundView = UIView()
        progressBackgroundView.frame.size.height = frame.size.height
        progressBackgroundView.backgroundColor = progressColor
        addSubview(progressBackgroundView)
        
        func createLabel() -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .bold)
            label.textColor = progressColor
            label.text = "100%"
            label.sizeToFit()
            label.text = "0%"
            label.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
            return label
        }
        
        backLabel = createLabel()
        addSubview(backLabel)
        
        frontLabel = createLabel()
        // No need to be added in view hierarchy
        // addSubview(frontLabel)
        
        progressContentView = UIView()
        progressContentView.backgroundColor = bgColor
        progressContentView.frame = progressBackgroundView.frame
        addSubview(progressContentView)
        
        // Use frontLabel.layer's alpha channel to mask progressContentView.layer's content.
        // According to the documentation, The opaque pixels (label text shape) will make content
        // (white progress color) visible, and the fully transparent pixels will block the content.
        progressContentView.layer.mask = frontLabel.layer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The current progress value. Valid Range: 0.0 ~ 1.0
    var progress: Float = 0.0 {
        didSet {
            let temp = max(0.0, progress)
            progress = min(temp, 1.0)
            
            let width = bounds.size.width * CGFloat(progress)
            progressBackgroundView.frame.size.width = width
            progressContentView.frame.size.width = width
            
            let text = String(format: "%0.f%%", progress * 100)
            backLabel.text = text
            frontLabel.text = text
        }
    }
    
}
