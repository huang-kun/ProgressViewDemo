//
//  ViewController.swift
//  ProgressViewDemo
//
//  Created by huangkun on 2019/4/13.
//  Copyright © 2019 huangkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressView: ProgressView!
    var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barSize = CGSize(width: view.bounds.size.width * 0.6, height: 44)
        progressView = ProgressView(frame: CGRect(origin: CGPoint.zero, size: barSize))
        progressView.center = view.center
        view.addSubview(progressView)
        
        slider = UISlider()
        slider.addTarget(self, action: #selector(moveSlider), for: .valueChanged)
        slider.frame.size.width = progressView.frame.size.width
        slider.frame.origin.y = progressView.frame.maxY + 40
        slider.center.x = view.center.x
        view.addSubview(slider)
    }

    @objc func moveSlider() {
        progressView.progress = slider.value
    }
}

