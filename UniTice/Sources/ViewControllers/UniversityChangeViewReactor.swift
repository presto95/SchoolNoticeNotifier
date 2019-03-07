//
//  UniversityChangeReactor.swift
//  UniTice
//
//  Created by Presto on 02/03/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

import ReactorKit
import RxCocoa
import RxSwift

/// 설정 대학교 변경 뷰 리액터.
final class UniversityChangeViewReactor: Reactor {
  
  enum Action {
    
    /// 대학교 변경.
    case changeUniversity(University)
    
    /// 확인.
    case confirm
  }
  
  enum Mutation {
    
    /// 대학교 설정.
    case setUniversity(University)
    
    /// 확인.
    case confirm
  }
  
  struct State {
    
    /// 대학교.
    var university: University?
    
    /// 확인 버튼이 선택된 상태인가.
    var isConfirmButtonSelected: Bool = false
  }
  
  /// 초기 상태.
  let initialState: State = State()
  
  /// 데이터 보존 서비스.
  let persistenceService: PersistenceServiceType
  
  init(persistenceService: PersistenceServiceType = PersistenceService.shared) {
    self.persistenceService = persistenceService
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .changeUniversity(university):
      return Observable.just(Mutation.setUniversity(university))
    case .confirm:
      return Observable.concat([
        resetUniversity(),
        Observable.just(Mutation.confirm)
        ])
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setUniversity(university):
      state.university = university
    case .confirm:
      state.isConfirmButtonSelected = true
    }
    return state
  }
}

// MARK: - Private Method

private extension UniversityChangeViewReactor {
  
  func resetUniversity() -> Observable<Mutation> {
    let university = currentState.university ?? .kaist
    return Observable
      .combineLatest(persistenceService.updateUniversity(university),
                     persistenceService.removeAllKeywords(),
                     persistenceService.removeAllBookmarks()) { _, _, _ in
                      return Mutation.confirm
    }
    //UniversityModel.shared.generateModel()
    //return .empty()
  }
}