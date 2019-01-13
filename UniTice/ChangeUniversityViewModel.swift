//
//  ChangeUniversityViewModel.swift
//  UniTice
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import RxSwift

struct ChangeUniversityViewModel {
    
    var universities = University.allCases.sorted { $0.rawValue < $1.rawValue }
    
    var selectedUniversity: University = .seoultech
}