//
//  School.swift
//  SchoolNoticeNotifier
//
//  Created by Presto on 11/11/2018.
//  Copyright © 2018 presto. All rights reserved.
//

import Foundation

/// 대학교를 정의한 열거형.
enum University: String, CaseIterable {
  
  // MARK: A
  
  case kaist = "KAIST"
  
  case kcu = "KC대학교"
  
  // MARK: ㄱ
  
  case kangnam = "강남대학교"
  
  case kangwon = "강원대학교"
  
  case knu = "경북대학교"
  
  case gsnu = "경상대학교"
  
  case ks = "경성대학교"
  
  case khu = "경희대학교"
  
  case korea = "고려대학교"
  
  case kw = "광운대학교"
  
  case kookmin = "국민대학교"
  
  // MARK: ㄴ
  
  // MARK: ㄷ
  
  case daejin = "대진대학교"
  
  case duksung = "덕성여자대학교"
  
  case dongguk = "동국대학교"
  
  case dongduk = "동덕여자대학교"
  
  case dsu = "동신대학교"
  
  // MARK: ㄹ
  
  // MARK: ㅁ
  
  case mju = "명지대학교"
  
  case mokpo = "목포대학교"
  
  // MARK: ㅂ
  
  case pknu = "부경대학교"
  
  case pusan = "부산대학교"
  
  // MARK: ㅅ
  
  case syu = "삼육대학교"
  
  case skuniv = "서경대학교"
  
  case seoultech = "서울과학기술대학교"
  
  case snue = "서울교육대학교"
  
  case snu = "서울대학교"
  
  case swu = "서울여자대학교"
  
  case skhu = "성공회대학교"
  
  case sungkyul = "성결대학교"
  
  case skku = "성균관대학교"
  
  case sungshin = "성신여자대학교"
  
  case sejong = "세종대학교"
  
  case sehan = "세한대학교"
  
  case sookmyung = "숙명여자대학교"
  
  // MARK: ㅇ
  
  case woosuk = "우석대학교"
  
  case ewha = "이화여자대학교"
  
  // MARK: ㅈ
  
  case jnu = "전남대학교"
  
  case jbnu = "전북대학교"
  
  case jejunu = "제주대학교"
  
  // MARK: ㅊ
  
  case chongshin = "총신대학교"
  
  case cnu = "충남대학교"
  
  case chungbuk = "충북대학교"
  
  // MARK: ㅋ
  
  // MARK: ㅌ
  
  // MARK: ㅍ
  
  // MARK: ㅎ
  
  case kpu = "한국산업기술대학교"
  
  case karts = "한국예술종합학교"
  
  case hufs = "한국외국어대학교"
  
  case hansung = "한성대학교"
  
  case hanyang = "한양대학교"
  
  case hongik = "홍익대학교"
}

extension University {
  
  /// 각 대학교에 따른 모델.
  var model: UniversityType {
    switch self {
    case .kaist: return KAIST()
    case .kcu: return KC대학교()
    case .kangnam: return 강남대학교()
    case .kangwon: return 강원대학교()
    case .knu: return 경북대학교()
    case .gsnu: return 경상대학교()
    case .ks: return 경성대학교()
    case .khu: return 경희대학교()
    case .korea: return 고려대학교()
    case .kw: return 광운대학교()
    case .kookmin: return 국민대학교()
    case .daejin: return 대진대학교()
    case .duksung: return 덕성여자대학교()
    case .dongguk: return 동국대학교()
    case .dongduk: return 동덕여자대학교()
    case .dsu: return 동신대학교()
    case .mju: return 명지대학교()
    case .mokpo: return 목포대학교()
    case .pknu: return 부경대학교()
    case .pusan: return 부산대학교()
    case .syu: return 삼육대학교()
    case .skuniv: return 서경대학교()
    case .seoultech: return 서울과학기술대학교()
    case .snue: return 서울교육대학교()
    case .snu: return 서울대학교()
    case .swu: return 서울여자대학교()
    case .skhu: return 성공회대학교()
    case .sungkyul: return 성결대학교()
    case .skku: return 성균관대학교()
    case .sungshin: return 성신여자대학교()
    case .sejong: return 세종대학교()
    case .sehan: return 세한대학교()
    case .sookmyung: return 숙명여자대학교()
    case .woosuk: return 우석대학교()
    case .ewha: return 이화여자대학교()
    case .jnu: return 전남대학교()
    case .jbnu: return 전북대학교()
    case .jejunu: return 제주대학교()
    case .chongshin: return 총신대학교()
    case .cnu: return 충남대학교()
    case .chungbuk: return 충북대학교()
    case .kpu: return 한국산업기술대학교()
    case .karts: return 한국예술종합학교()
    case .hufs: return 한국외국어대학교()
    case .hansung: return 한성대학교()
    case .hanyang: return 한양대학교()
    case .hongik:return 홍익대학교()
    }
  }
}
