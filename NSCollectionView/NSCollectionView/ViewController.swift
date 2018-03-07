//
//  ViewController.swift
//  NSCollectionView
//
//  Created by Liu Chuan on 2017/12/23.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    /// 集合视图
    @IBOutlet weak var collectionView: NSCollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 布局
        let layout = collectionView.collectionViewLayout as? NSCollectionViewFlowLayout
        // 是否固定头部视图
        layout?.sectionHeadersPinToVisibleBounds = true
        // 是否固定底部视图
        layout?.sectionFootersPinToVisibleBounds = false
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


// MARK: - NSCollectionViewDataSource
extension ViewController: NSCollectionViewDataSource {
    // 单元格个数
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 10
    }
    
    // 每组的个数
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    // 设置单元格
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // 创建或返回指定类型的可重用项目对象
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)
        
        return item
    }
    // 分区头部视图
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        
        var nibName: String?
        if kind == NSCollectionView.elementKindSectionHeader {
            nibName = "Header"
        } else if kind == NSCollectionView.elementKindSectionFooter {
            nibName = "Footer"
        }
        
        // 获取重用item,查找指定类型的可回收补充视图，如果存在，则返回该视图。如果不存在，则使用 register(_:forSupplementaryViewOfKind:withIdentifier:) 创建它
        let view = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: nibName!), for: indexPath)
        
        // 视图是否使用图层
        view.wantsLayer = true
        
        // 图层背景色
        view.layer?.backgroundColor = NSColor.gridColor.cgColor
        
        if let headerV = view as? HeaderView {
            headerV.titleTextField.stringValue = "Header"
        } else if let footerV = view as? FooterView {
            footerV.titleTextField.stringValue = "Footer"
        }
        return view
    }
    
}


// MARK: - NSCollectionViewDelegate
extension ViewController : NSCollectionViewDelegate {
    
    // 选中item调用这个方法
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print("选中item \(indexPaths)")
    }
    
    // 取消选中item时,调用代理的这个方法
    func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
        print("取消选中item \(indexPaths)")
    }
}

// MARK: - NSCollectionViewDelegateFlowLayout
extension ViewController: NSCollectionViewDelegateFlowLayout {
    
    // Cell的大小
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 100, height: 50)
    }
    
    /// 集合视图每个Section的四边间距
    ///
    /// - Parameters:
    ///   - collectionView: 显示流布局的集合视图对象
    ///   - collectionViewLayout: 请求信息的布局对象
    ///   - section: 需要边距的部分的索引
    /// - Returns: NSEdgeInsets
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, insetForSectionAt section: Int) -> NSEdgeInsets {
        
        return NSEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // 每行cell之间的间距
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        
        return NSSize(width: 0, height: 20)
    }
    // 每个cell之间的间距
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        
        return NSSize(width: 0, height: 20)
    }
}
