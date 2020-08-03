//
//  MovieService.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/08/03.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import Foundation
import Moya

enum MovieService {
    case latest
    case nowPlaying
    case popular
}

extension MovieService : TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/movie")!
    }
    
    var path: String {
        switch self {
        case .latest:
            return "/latest"
        case .nowPlaying:
            return "/now_playing"
        case .popular:
            return "/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .latest, .nowPlaying, .popular:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .latest, .nowPlaying, .popular:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .latest, .nowPlaying, .popular:
            return .requestParameters(parameters: ["api_key" : "ab5dcb3f4f944613e03aa87a569438c6"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/JSON"]
    }
    
    
}
