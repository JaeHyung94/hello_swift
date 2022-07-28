//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "File.png")
    }
    
    @IBAction func goToImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func goToDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}
