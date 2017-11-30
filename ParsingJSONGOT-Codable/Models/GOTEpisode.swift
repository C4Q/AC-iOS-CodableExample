//
//  GOTEpisode.swift
//  ParsingJSONGOT-Codable
//
//  Created by C4Q  on 11/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct GOTViewModel {
    let fancyName: String
    let formattedRuntime: String
    let hasSummary: Bool
    init(from episode: GOTEpisode) {
        self.fancyName = "\(episode.name)!!!!"
        self.formattedRuntime = "runtime: \(episode.runtime?.description ?? "no runtime")"
        self.hasSummary = episode.summary != ""
    }
}

struct GOTEpisode: Codable {
    let name: String
    let runtime: Int?
    let summary: String
    let image: ImageWrapper
    let _links: LinkWrapper
}

struct ImageWrapper: Codable {
    let medium: String
    let original: String
}

struct LinkWrapper: Codable {
    let `self`: SelfWrapper
}

struct SelfWrapper: Codable {
    let href: String
}
