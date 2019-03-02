//
//  KeywordCellReactor.swift
//  UniTice
//
//  Created by Presto on 02/03/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

import ReactorKit
import RxCocoa
import RxSwift

final class KeywordCellReactor: Reactor {
  
  enum Action {
    
  }
  
  enum Mutation {
    
  }
  
  struct State {
    
  }
  
  let initialState: State = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    return .empty()
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    return state
  }
}
