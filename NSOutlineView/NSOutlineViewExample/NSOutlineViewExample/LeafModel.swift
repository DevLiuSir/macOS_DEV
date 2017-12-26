//
//  LeafModel.swift
//  NSOutlineViewExample
//
//  Created by Liu Chuan on 2018/12/6.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class LeafModel: NSObject {
    
    /// 叶子节点名称
    var leafName = ""
   
    /// 该叶子节点是否有字节点（本示例中仅为两级结构，因此叶子节点下没有子节点）
    var hasChildren = false
    
    // MARK: -构造方法
    init(_ name : String) {
        self.leafName = name
    }
}
