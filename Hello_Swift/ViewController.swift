//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handleImagePinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func handleImagePinch(_ pinch: UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
        
    }
}
