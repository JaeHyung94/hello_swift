//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var urlInput: UITextField!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let target = checkURL(url: url)
        let targetUrl = URL(string: target)
        let request = URLRequest(url: targetUrl!)
        
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        loadWebPage("https://naver.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func checkURL(url: String) -> String {
        var target = url
        let flag = target.hasPrefix("https://")
        
        if !flag {
            target = "https://" + target
        }
        
        return target
    }

    @IBAction func handleSubmit(_ sender: UIButton) {
        let target = checkURL(url: urlInput.text!)
        urlInput.text = ""
        loadWebPage(target)
    }
    
    @IBAction func handleSite1Button(_ sender: UIButton) {
        loadWebPage("https://yonsei.ac.kr")
    }
    
    @IBAction func handleSite2Button(_ sender: UIButton) {
        loadWebPage("https://velog.io")
    }
    
    @IBAction func handleHTMLButton(_ sender: UIButton) {
        let htmlString = "<h1>This is htmlString</h1><a href=\"https://daum.net\">daum.net으로 이동</a>"
        
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func handleFileButton(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "samplehtml", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    @IBAction func handleCancel(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func handleRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func handleGoBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func handleGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}
