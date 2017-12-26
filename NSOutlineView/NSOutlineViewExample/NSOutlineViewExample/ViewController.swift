//
//  ViewController.swift
//  NSOutlineViewExample
//
//  Created by Liu Chuan on 2018/12/6.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    /// 大纲视图
    @IBOutlet weak var outlineView: NSOutlineView!
    
    /// 跟节点数组
    private var rootArray = [RootModel]()
    
    // MARK: - 视图的生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        configDataModel()
        
        
        outlineView.reloadData()
        
    }
    
    // MARK: - 视图加载完成调用
    // 每次加载视图都要执行的动作，应该放在ViewDidAppear方法中
    override func viewDidAppear() {
        
        // 展开所有节点
        outlineView.expandItem(nil, expandChildren: true)
        
        // 展开第一个节点
//        outlineView.expandItem(outlineView.item(atRow: 0), expandChildren: true)
        // 展开第二个节点
//         outlineView.expandItem(outlineView.item(atRow: 1), expandChildren: true)
    }
  

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

// MARK: - 配置数据
extension ViewController {
    
    /// 配置数据
    private func configDataModel() {
        
        let leaf1 = LeafModel("Objetive-C")
        let leaf2 = LeafModel("Swift")
        let leaf3 = LeafModel("Python")
        let leaf4 = LeafModel("Java")
        let leaf5 = LeafModel("Kotlin")
        let leaf6 = LeafModel("Go")
        let leaf7 = LeafModel("PHP")
        
        let root1 = RootModel()
        root1.name = "Programming Language"
        root1.children = [leaf1, leaf2, leaf3, leaf4, leaf5, leaf6, leaf7]
        
        let leaf8 = LeafModel("Beijing")
        let leaf9 = LeafModel("Tianjin")
        let leaf10 = LeafModel("Shanghai")
        let leaf11 = LeafModel("Chongqing")
        let leaf12 = LeafModel("Guangzhou")
        let leaf13 = LeafModel("Shenzhen")
        
        let root2 = RootModel()
        root2.name = "City"
        root2.children = [leaf8, leaf9, leaf10, leaf11, leaf12, leaf13]
        
        rootArray = [root1, root2]
    }
}


// MARK: NSOutlineView DataSource
extension ViewController : NSOutlineViewDataSource {
    
    // 该方法可以让 NSOutlineView 获得每个层级需要显示的节点数，当数据为顶级节点（根节点）时，item的值为nil
    // 当NSOutlineView 需要展示数据时，第一步会调用此方法
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        
        if  let item = item as? RootModel {
            return item.children.count
        }
        return rootArray.count
    }
    // 该方法可以让 NSOutlineView 可以判断本层级节点是否可以展开（是否有子节点），本示例中，仅演示两层结构
    // 当NSOutlineView 需要展示数据时，第三步会调用此方法
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return item is RootModel
    }
    // 该方法可以让 NSOutlineView知道每个层级节点的显示数据
    // 当NSOutlineView 需要展示数据时，第二步会调用此方法
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? RootModel {
            return item.children[index]
        }
        return rootArray[index]
    }
}
// MARK: NSOutlineViewDelegate
extension ViewController : NSOutlineViewDelegate{
    
    // 通过这个代理方法，NSOutlineView生成每个节点的视图，这样我们才能看到效果
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        var cell : NSTableCellView?
        
        if item is RootModel{
            cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("HeaderCell"), owner: self) as? NSTableCellView
            cell?.textField?.stringValue = (item as? RootModel)?.name ?? ""
        }else{
            cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("DataCell"), owner: self) as? NSTableCellView
            cell?.textField?.stringValue = (item as? LeafModel)?.leafName ?? ""
            cell?.backgroundStyle = .light
        }
        return cell
    }
}
