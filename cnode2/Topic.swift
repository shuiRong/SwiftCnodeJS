//
//  Topic.swift
//  cnode2
//
//  Created by shuironglin on 2019/6/21.
//  Copyright © 2019 shuironglin. All rights reserved.
//

import Foundation

class Topic{
    var userName:String
    var title:String
    var time:String
    var avatar:String
    
    init(userName:String,title:String,time:String,avatar:String) {
        self.userName = userName
        self.title = title
        self.time = time
        self.avatar = avatar
    }
}
