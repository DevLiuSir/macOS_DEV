//
//  CollectionViewItem.swift
//  NSCollectionView-Header-Footer
//
//  Created by Harry Ng on 13/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 视图是否使用图层
        view.wantsLayer = true
        // 图层背景色
        view.layer?.backgroundColor = NSColor.orange.cgColor
    }
    
}
