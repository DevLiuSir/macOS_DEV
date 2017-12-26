//
//  RootModel.swift
//  NSOutlineViewExample
//
//  Created by Liu Chuan on 2018/12/6.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class RootModel: NSObject {
    
    /// 名称
    var name = ""
    
    /// 是否叶子节点
    var isLeaf = false
    
    /// 子节点数组属性
    var children = [LeafModel]()

}
