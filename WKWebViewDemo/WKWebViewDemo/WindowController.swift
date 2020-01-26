//
//  WindowController.swift
//  WKWebViewDemo
//
//  Created by Liu Chuan on 2020/10/15.
//

import Cocoa

protocol TabDelegate: class {
    
    func createTab(newWindowController: WindowController, inWindow window: NSWindow, ordered orderingMode: NSWindow.OrderingMode)
    
}


class WindowController: NSWindowController {
    
    
    /// 创建控制器
    /// - Returns: WindowController
    static func createController() -> WindowController {
        let windowStoryboard = NSStoryboard(name: "Main", bundle: Bundle(identifier: "WindowController"))
        return windowStoryboard.instantiateInitialController() as! WindowController
    }
    
    
    /// 地址栏
    @IBOutlet weak var urlAdressTextField: NSTextField!
    
    /// 窗口视图的控制器
    private lazy var contentVC = self.contentViewController as! ViewController
    
    
    weak var tabDelegate: TabDelegate?
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // 辞去第一响应者
        urlAdressTextField.resignFirstResponder()
    }
    
    // 新建标签页
    override func newWindowForTab(_ sender: Any?) {
        guard let mainKeyWindow = self.window else {
            preconditionFailure("Expected window to be loaded")
        }
        
        guard let tabDelegate = self.tabDelegate else { return }

        tabDelegate.createTab(newWindowController: WindowController.createController(), inWindow: mainKeyWindow, ordered: .above)
        
        
        inspectWindowHierarchy()
    }
    
    
    func inspectWindowHierarchy() {
        let rootWindow = self.window!
        print("Root window", rootWindow, rootWindow.title, "has tabs:")
        rootWindow.tabbedWindows?.forEach { window in
            print("- ", window, window.title, "isKey =", window.isKeyWindow, ", isMain =", window.isMainWindow, " at ", window.frame)
        }
    }
    

    
    
    func startLoading() {
        let url = "\(urlAdressTextField.stringValue)"
        contentVC.loadURL(url)
    }

}

// MARK: - Actions
extension WindowController {
    
    /// URL地址栏点击事件
    /// - Parameter sender: NSTextField
    @IBAction func URLAdressTextFieldTap(_ sender: NSTextField) {
        
        // 成为第一响应者
        sender.becomeFirstResponder()
    }
    
    
    /// 后退（上一页）
    /// - Parameter sender: NSButton
    @IBAction func backPage(_ sender: NSButton) {
        contentVC.webView.goBack()
    }
    
    /// 前进（下一页）
    /// - Parameter sender: NSButton
    @IBAction func forwardPage(_ sender: NSButton) {
        contentVC.webView.goForward()
        
    }
    
    /// 刷新页面
    /// - Parameter sender: NSButton
    @IBAction func refreshPage(_ sender: NSButton) {
        contentVC.webView.reload()  // 重新载入
    }
    
    /// 首页
    /// - Parameter sender: NSButton
    @IBAction func homePage(_ sender: NSButton) {
        
        
    /**
         获取已打开页面数量
         UIWebView提供了pagecount，但是没有卵用，不准确；
         WKWebView中有backForwardList记录了可回退的页面信息，已打开页面数量 = backForwardList数量 + 当前1页
    */

//        int pageCount = self.webView.backForwardList.count + 1;

        let historySize = contentVC.webView.backForwardList.backList.count
        let firstItem = contentVC.webView.backForwardList.item(at: -historySize)
        
        // go to it!
        contentVC.webView.go(to: firstItem!)
    }
    
    
    
    @IBAction func shareButtonClicked(_ sender: NSButton) {
        let btn = sender as NSView
        if let url = contentVC.webView.url {
            let sharer = NSSharingServicePicker(items: [url])
            sharer.delegate = self
            sharer.show(relativeTo: btn.bounds, of: btn, preferredEdge: NSRectEdge.minY)
            //sharer.style = 1 // https://github.com/iljaiwas/NSSharingPickerTest/pull/1
        }
    }
    
    
}





// MARK: - NSSharingServicePickerDelegate
extension WindowController: NSSharingServicePickerDelegate {
    
    
    
    
    
    
    
}


// MARK: - NSTextFieldDelegate
extension WindowController: NSTextFieldDelegate {
    
    /// 当用户在指定控件的单元格中，接收并处理用户输入的按键操作时调用
    /// - Parameters:
    ///   - control: 是指发送按键请求的 control，这里是指对应的 NSTextField
    ///   - textView: NSTextView
    ///   - commandSelector: 对应输入的键
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        
        switch commandSelector {

        // 当检测到按键是 Enter 回车键时，
        // 对应的其它按键可以去 NSResponder 中查看，这里中列举了 Enter 这个键
        case #selector(NSResponder.insertNewline(_:)):

            // 这里面就是当按下 Enter 键时，你需要做的一些东西了
            // 1. 判断发送这个按键的 control 是不是 NSTextField
            if let inputView = control as? NSTextField {

                // 2. 当在 textField 按下回车时
                if inputView == urlAdressTextField {
                    startLoading()
                    urlAdressTextField.resignFirstResponder()
                }
            }
            
            // 3. 当你处理了对应的按键操作时，返回 true
            return true

        default:
            // 4. 默认返回 false，表示其它按键操作不会自己处理，交给系统处理
            return false
        }
    }
    
}

