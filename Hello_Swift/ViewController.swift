//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    var maxLength = 6
    var currentLength = 1
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = UIImage(named: "1.png")
    }
    
    @IBAction func handleNext(_ sender: UIButton) {
        currentLength = currentLength + 1
        if(currentLength > maxLength) {
            currentLength = 1
        }
        
        imgView.image = UIImage(named: "\(currentLength).png")
    }
    
    @IBAction func handlePrev(_ sender: UIButton) {
        if(currentLength == 1) {
            currentLength = maxLength
        } else {
            currentLength = currentLength - 1
        }
        
        imgView.image = UIImage(named: "\(currentLength).png")
    }
}

