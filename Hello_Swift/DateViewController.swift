//
//  DateViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/28.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var labelCurrentDate: UILabel!
    @IBOutlet var labelSelectedDate: UILabel!
    
    let INTERVAL = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: INTERVAL, target: self, selector: #selector(self.timer), userInfo: nil, repeats: true)
    }
    
    @objc func timer() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        labelCurrentDate.text = "현재 시간: " + formatter.string(from: Date())
    }
    
    @IBAction func handleSelectDate(_ sender: UIDatePicker) {
        let target = sender.date
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        labelSelectedDate.text = "선택 시간: " + formatter.string(from: target)
    }
}
