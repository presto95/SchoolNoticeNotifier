//
//  Kanna.swift
//  UniTice
//
//  Created by Presto on 13/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Kanna

protocol HTMLParseServiceType: class {
  func request(_ url: URL,
               encoding: String.Encoding,
               completion: @escaping (HTMLDocument?, Error?) -> Void)
}

final class HTMLParseService: HTMLParseServiceType {
  
  static let shared = HTMLParseService()
  
  func request(_ url: URL,
               encoding: String.Encoding = .utf8,
               completion: @escaping (HTMLDocument?, Error?) -> Void) {
    DispatchQueue.global(qos: .background).async {
      do {
        let doc = try HTML(url: url, encoding: encoding)
        completion(doc, nil)
      } catch {
        completion(nil, error)
      }
    }
  }
}