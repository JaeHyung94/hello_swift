//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    let INTERVAL = 1.0
    var selectedTime: String!
    var currentTime: String!
    var isAlertOn: Bool = false
    
    @IBOutlet var labelCurrentDate: UILabel!
    @IBOutlet var labelSelectedDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: INTERVAL, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
    }
    
    @objc func timer() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        labelCurrentDate.text = "현재 시간: " + formatter.string(from: currentDate)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        currentTime = formatter.string(from: currentDate)
        
        if currentTime != nil && selectedTime != nil {
            if selectedTime <= currentTime && !isAlertOn {
                let alertController = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: UIAlertController.Style.alert)
                
                let alertAction = UIAlertAction(title: "넹!", style: UIAlertAction.Style.default, handler: {
                    ACTION in self.selectedTime = formatter.string(from: Date() + 60)
                    self.isAlertOn = false
                })
                
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: {
                    self.isAlertOn = true
                })
            }
        }
    }

    @IBAction func handleSelectDate (_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        labelSelectedDate.text = "선택 시간: " + formatter.string(from: sender.date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        selectedTime = formatter.string(from: sender.date)
    }
}
