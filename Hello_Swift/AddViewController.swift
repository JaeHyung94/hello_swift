//
//  AddViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var taskAddInput: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imagePicker: UIPickerView!
    
    var itemFileName = ["cart.png", "clock.png", "pencil.png"]
    var targetImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.dataSource = self
        
        targetImage = itemFileName[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80.0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let targetImageView = UIImageView(image: UIImage(named: itemFileName[row]))
        targetImageView.frame = CGRect(x: 0, y: 0, width: 80.0, height: 80.0)
        return targetImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: itemFileName[row])
        targetImage = itemFileName[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func handleAddItem(_ sender: UIButton) {
        items.append(taskAddInput.text!)
        itemsImages.append(targetImage)
        
        taskAddInput.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
}
