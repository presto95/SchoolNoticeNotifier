//
//  MainNoticeHeaderViewReactor.swift
//  UniTice
//
//  Created by Presto on 03/03/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

import ReactorKit
import RxCocoa
import RxSwift

final class MainNoticeHeaderViewReactor: Reactor {
  
  enum Action {
    
    case toggleFolding
  }
  
  enum Mutation {
    
    case toggleFolding
  }
  
  struct State {
    
    /// The boolean value indicating whether the upper posts are folded.
    var isUpperPostFolded: Bool
  }
  
  let initialState: State
  
  let userDefaultsService: UserDefaultsServiceType
  
  init(userDefaultsService: UserDefaultsServiceType = UserDefaultsService.shared) {
    self.userDefaultsService = userDefaultsService
    initialState = State(isUpperPostFolded: userDefaultsService.isUpperPostFolded)
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .toggleFolding:
      return Observable.just(Mutation.toggleFolding)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .toggleFolding:
      state.isUpperPostFolded.toggle()
    }
    return state
  }
}
