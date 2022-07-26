//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.checkTimer)
    var selectedDate: Date!
    var currentDate: Date!
    
    @IBOutlet var labelCurrentDate: UILabel!
    @IBOutlet var labelSelectedDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func handleSelectDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        selectedDate = sender.date
            labelSelectedDate.text = "선택 시간: " + formatter.string(from: selectedDate)
    }
    
    @objc func checkTimer() {
        let formatter = DateFormatter()
        currentDate = Date()
        
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        labelCurrentDate.text = "현재 시간: " + formatter.string(from: currentDate)

        if(selectedDate != nil && currentDate >= (selectedDate + 60)) {
            self.view.backgroundColor = UIColor.white
        } else if (selectedDate != nil && currentDate > selectedDate) {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
}

