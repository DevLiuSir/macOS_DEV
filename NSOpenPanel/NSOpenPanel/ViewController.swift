//
//  ViewController.swift
//  NSOpenPanel
//
//  Created by Liu Chuan on 2020/4/7.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var imageView: NSImageView!
    
    
    /// 支持打开的图片格式
    var supportedImageFormats: [String] {
        return ["png", "jpg", "jpeg"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

//MARK: - Actions
extension ViewController {
    
    @IBAction func importBtnClick(_ sender: NSButton) {
        
        let addFolderPanel = NSOpenPanel()
        
        // 是否允许用户选择要打开的文件。
        addFolderPanel.canChooseFiles = true
        
        // 是否允许用户选择要打开的目录。
        addFolderPanel.canChooseDirectories = false
        
        // 是否允许用户创建目录。
        addFolderPanel.canCreateDirectories = false
        
        // 是否允许用户一次打开多个文件（和目录）
        addFolderPanel.allowsMultipleSelection = false
        
        // NSString对象数组，用于指定面板允许的文件类型。
        addFolderPanel.allowedFileTypes = supportedImageFormats
        
        addFolderPanel.title = "Select an image to open."
        
        let response = addFolderPanel.runModal()
        
        if response == NSApplication.ModalResponse.OK {
            
            guard let selectedURL = addFolderPanel.url else { return }
            
            // URL的最后一个路径部分；如果路径为空字符串，则为空字符串。这里为文件名
            let folderName = selectedURL.lastPathComponent
            
            print("视频文件路径: \(selectedURL.path)")
            print("当前选择的文件名: \(folderName)")
            
            let picture = NSImage(contentsOf: selectedURL)
            
            imageView.image = picture
        }
    }
}

