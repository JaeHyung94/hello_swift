//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: images[currentIndex])
        pageControl.currentPage = currentIndex
        pageControl.numberOfPages = images.count
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipe(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                
                if currentIndex > 0 {
                    currentIndex -= 1
                    pageControl.currentPage = currentIndex
                    imageView.image = UIImage(named: images[currentIndex])
                }
            case UISwipeGestureRecognizer.Direction.left:
                
                if currentIndex < images.count - 1 {
                    currentIndex += 1
                    pageControl.currentPage = currentIndex
                    imageView.image = UIImage(named: images[currentIndex])
                }
            default:
                break
            }
        }
    }
    
    @IBAction func handlePaging(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[sender.currentPage])
    }
 }
