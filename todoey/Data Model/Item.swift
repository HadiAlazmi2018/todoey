//
//  Item.swift
//  todoey
//
//  Created by hadi alazmi on 9/8/18.
//  Copyright © 2018 hadi alazmi. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
