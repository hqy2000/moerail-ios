//
//  DynamicTrackingRequest.swift
//  ios
//
//  Created by hqy2000 on 7/8/19.
//  Copyright © 2019 hqy2000. All rights reserved.
//

import Foundation
import Moya

enum DynamicTrackingRequest {
    case train(keyword: String)
    case trains(keywords: [String])
    case emu(keyword: String)
}

extension DynamicTrackingRequest: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.moerail.ml/")!
    }
    
    var path: String {
        switch self {
        case .train(let keyword):
            return "train/" + keyword
        case .trains(let keywords):
            return "train/" + keywords.reduce("", { prev, current in
                return prev + "," + current
            })
        case .emu(let keyword):
            return "emu/\(keyword)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}