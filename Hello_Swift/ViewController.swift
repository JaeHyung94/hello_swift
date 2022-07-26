//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var labelCurrentDate: UILabel!
    @IBOutlet var labelSelectDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func handleSelect(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        labelSelectDate.text = "선택 시간: " + formatter.string(from: sender.date)
    }
    
    @objc func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:s EEE"
        
        labelCurrentDate.text = "현재 시간: " + formatter.string(from: Date())
    }
}

