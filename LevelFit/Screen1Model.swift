//
//  Screen1Model.swift
//  LevelFit
//
//  Created by Nishit Vats on 26/02/25.
//

import Foundation

struct MenuOptionModel:Identifiable{
    
    init(icon: String, title: String) {
        self.icon = icon
        self.title = title
    }
    var id = UUID()
    var icon:String
    var title:String
}

struct TitleCardModel:Identifiable{
    var id = UUID()
    var image:String
    var tag:String
    var sideTag:String?
    var title :String
    var author:String
}

struct FeaturedCardModel: Identifiable{
    
    init(tag: String,title:String, backGround: String, author: String, context: String) {
        self.title = title
        self.tag = tag
        self.backGround = backGround
        self.author = author
        self.context = context
    }
    
    var id = UUID()
    var tag:String
    var title :String
    var backGround:String
    var author:String
    var context:String
}

