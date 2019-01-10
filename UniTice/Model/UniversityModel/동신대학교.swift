//
//  동신대학교.swift
//  UniTice
//
//  Created by Presto on 08/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Kanna

struct 동신대학교: UniversityScrappable {
    
    var name: String {
        return "동신대학교"
    }
    
    var categories: [동신대학교.Category] {
        return [
            ("notice", "일반공지"),
            ("notiuniv", "학사/등록"),
            ("notischlr", "장학/학자금"),
            ("dsunoti2", "교외공지")
        ]
    }
    
    func requestPosts(inCategory category: 동신대학교.Category, inPage page: Int, searchText text: String, _ completion: @escaping (([Post]?, Error?) -> Void)) {
        DispatchQueue.global(qos: .background).async {
            var posts = [Post]()
            do {
                let url = try self.pageURL(inCategory: category, inPage: page, searchText: text)
                let doc = try HTML(url: url, encoding: .utf8)
                let rows = doc.xpath("//tbody//tr//td")
                let links = doc.xpath("//tbody//tr//td//a/@href")
                for (index, element) in links.enumerated() {
                    let multiplier = category.identifier == "notiuniv" || category.identifier == "notischlr" ? 6 : 5
                    let numberIndex = index * multiplier
                    let titleIndex = index * multiplier + multiplier - 4
                    let dateIndex = index * multiplier + multiplier - 2
                    let number = Int(rows[numberIndex].text?.trimmed ?? "") ?? 0
                    let title = rows[titleIndex].text?.trimmed ?? "?"
                    let date = rows[dateIndex].text?.trimmed ?? "?"
                    let link = element.text?.trimmed ?? "?"
                    let post = Post(number: number, title: title, date: date, link: link)
                    posts.append(post)
                }
                completion(posts, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

extension 동신대학교 {
    var baseURL: String {
        return "https://www.dsu.ac.kr"
    }
    
    var commonQueries: String {
        return "/kr/index.php?sf=b_subject"
    }
    
    func categoryQuery(_ category: 동신대학교.Category) -> String {
        return "&pCode=\(category.identifier)"
    }
    
    func pageQuery(_ page: Int) -> String {
        return "&pg=\(page)"
    }
    
    func searchQuery(_ text: String) -> String {
        return "&skey=\(text.percentEncoding)"
    }
}
