//
//  Category.swift
//  todoey
//
//  Created by hadi alazmi on 9/8/18.
//  Copyright © 2018 hadi alazmi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name:String = ""
    let items = List<Item>()
}
