//
//  Comics.swift
//  comics
//
//  Created by Carlos Arismendy on 14/12/23.
//

import Foundation

public struct ComicDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: ComicDataContainer?
    let etag: String?
}

struct ComicDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Comic]?
}

struct Comic: Codable {
    let id: Int?
    let digitalId: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription: String?
    let description: String?
    let modified: String?
    let isbn: String?
    let upc: String?
    let diamondCode: String?
    let ean: String?
    let issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [Urll]?
    let series: SeriesSummary?
    let variants: [ComicSummary]?
    let collections: [ComicSummary]?
    let collectedIssues: [ComicSummary]?
    let dates: [ComicDate]?
    let prices: [ComicPrice]?
    let thumbnail: Imagee?
    let images: [Imagee]?
    let creators: CreatorList?
    let characters: CharacterList?
    let stories: StoryList?
    let events: EventList?
}

struct TextObject: Codable {
    let type: String?
    let language: String?
    let text: String?
}

struct ComicDate: Codable {
    let type: String?
    let date: String?
}

struct ComicPrice: Codable {
    let type: String?
    let price: Float?
}

struct CreatorList: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [CreatorSummary]?
}

struct CreatorSummary: Codable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

struct CharacterList: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [CharacterSummary]?
}

struct CharacterSummary: Codable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

