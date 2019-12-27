//
//  Article.swift
//  NewsAPI
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String? = ""
    var author: String? = ""
    var desc: String? = ""
    var img: String? = ""

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case desc = "description"
        case img = "urlToImage"

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        author = (try? values.decode(String.self, forKey: .author)) ?? ""
        desc = (try? values.decode(String.self, forKey: .desc)) ?? ""
        img = (try? values.decode(String.self, forKey: .img)) ?? ""
    }
}

struct ArticleDataStore: Codable {
    var articles: [Article]
}
