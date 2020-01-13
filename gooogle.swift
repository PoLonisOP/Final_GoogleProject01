//
//  gooogle.swift
//  FinalProject
//
//  Created by User20 on 2019/12/24.
//  Copyright © 2019 000. All rights reserved.
//

import Foundation

struct image: Codable {
    var src: URL
}

struct tags: Codable {
    var cse_image: [image]?
}

struct Items: Codable {
    var title: String
    var displayLink: String
    var snippet: String
    var link: URL
    var pagemap: tags
}

struct SearchResults: Codable {
    var items: [Items]
}
