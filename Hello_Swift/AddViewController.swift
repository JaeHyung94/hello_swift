//
//  AddViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var taskAddInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        itemsImages.append("clock.png")
        
        taskAddInput.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
}
