//
//  FootballData.swift
//  Scores
//
//  Created by Zaid Alderi on 19/09/2022.
//

import Foundation
struct FootballData : Codable{
    let response: [Response]
}

struct Response: Codable {
    let league: League
}

struct League: Codable {
    let id: Int
    let name: String
    let country: String
    let standings : [[Standings]]
}

struct Standings: Codable {
    let rank: Int
    let team: Team
    let points: Int
    let form: String
    let goalsDiff: Int
    let all: All
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct All: Codable {
    let played: Int
    let win: Int
    let draw: Int
    let lose: Int
    //let goals: [Goals]
}
//
//struct Goals: Codable {
//    let `for`: Int
//    let against: Int
//}

