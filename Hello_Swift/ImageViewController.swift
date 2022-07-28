//
//  ImageViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/28.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var buttonTitle: UIButton!
    
    let imageOn = UIImage(named: "lamp_on.png")
    let imageOff = UIImage(named: "lamp_off.png")
    var isOn = true
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageOn
    }
    
    @IBAction func handleImageSize(_ sender: UIButton) {
        let scale = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.width / scale
            buttonTitle.setTitle("축소", for: .normal)
        } else {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            buttonTitle.setTitle("확대", for: .normal)
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func handleOnOff(_ sender: UISwitch) {
        if isOn {
            imageView.image = imageOff
            isOn = false
        } else {
            imageView.image = imageOn
            isOn = true
        }
    }
}
