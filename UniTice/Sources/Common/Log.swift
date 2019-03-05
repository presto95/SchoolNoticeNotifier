//
//  Log.swift
//  UniTice
//
//  Created by Presto on 28/02/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

func debugLog(_ message: Any,
              file: String = #file,
              function: String = #function,
              line: Int = #line) {
  #if DEBUG
  let fileName = file.split(separator: "/").last ?? ""
  let functionName = function.split(separator: "(").first ?? ""
  print("👻 [\(fileName)] \(functionName)(\(line)): \(message)")
  #endif
}

func errorLog(_ message: Any,
              file: String = #file,
              function: String = #function,
              line: Int = #line) {
  let fileName = file.split(separator: "/").last ?? ""
  let functionName = function.split(separator: "(").first ?? ""
  print("❌ [\(fileName)] \(functionName)(\(line)): \(message)")
}
