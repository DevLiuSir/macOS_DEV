//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by Liu Chuan on 2020/10/15.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    /// 进度条
    @IBOutlet var progressBar: NSProgressIndicator!
    

//    var webView: WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configWebView()
        
    }
    
    
}

// MARK: - Configure
extension ViewController {
    
    /// 配置webView
    private func configWebView() {
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0.1 Safari/604.3.5"
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    /// 在 WKWebView 加载指定 URL
    /// - Parameter url: URL地址
    public func loadURL(_ url: String) {
        
        //简写
        //webView.load(URLRequest(url: URL(string: "https://www.apple.com.cn/")!))
        
        // 1.URL 定位资源 需要的资源的地址
        guard let html = URL(string: url) else { return }

        // 2.把URL发送给服务器。请求从指定网址请求数据
        let request = URLRequest(url: html)

        // 3.发送请求数据
        webView.load(request)
    }
    
    /// 设置进度条
    /// - Parameter value: 进度值
    private func setProgress(_ value: Double) {
        if value == 100 {
            progressBar.isHidden = true
            return
        }
        progressBar.isHidden = false
        //修改进度值
        progressBar.doubleValue = value
    }
    
}


// MARK: - WKUIDelegate
extension ViewController: WKUIDelegate {

//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//
//
//
//    }
    

    // 显示文件上传面板。
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        
        let openDialog = NSOpenPanel()
        openDialog.allowsMultipleSelection = parameters.allowsMultipleSelection
        
        if let window = webView.window {
            NSApplication.shared.requestUserAttention(.informationalRequest)
            openDialog.beginSheetModal(for: window) { (choice: NSApplication.ModalResponse) in
                if choice == .OK {
                    completionHandler(openDialog.urls)
                }else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    



}

// MARK: - WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
    
    
    
    /**
     页面开始加载
     */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载....")
        setProgress(0)
    }
    
    /* 开始返回内容 **/
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        webView.isHidden = false
        progressBar.isHidden = false
    }
    
    
    /* 页面加载完成 */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressBar.isHidden = true
        setProgress(100)
        webView.becomeFirstResponder()
        print("加载完成......")
    }
    
    /* 页面加载失败 */
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("页面加载失败.....\(error)")
    }
    
}
