//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var labelPage: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    var pages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        labelPage.text = String(pages[0])
    }
    
    
    @IBAction func handlePageControl(_ sender: UIPageControl) {
        labelPage.text = String(pages[pageControl.currentPage])
    }
}
