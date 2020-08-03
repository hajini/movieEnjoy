//
//  Movie.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/08/03.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var results : [Result]
}

struct Result : Decodable {
    var popularity : Int
    var vote_count : Int
    var video : Bool
    var poster_path : String
    var id : Int
    var adult : Bool
    var backdrop_path : String
    var original_language : String
    var original_title : String
    var genre_ids : [Int]
    var title : String
    var vote_average : Int
    var overview : String
    var release_date : String
    
}


