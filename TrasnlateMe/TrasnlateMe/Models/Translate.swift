//
//  Translate.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

/*
import Foundation

struct ResponseData: Codable {
    let translatedText: String
    let match: Int

    enum CodingKeys: String, CodingKey {
        case translatedText
        case match
    }
}

struct Match: Codable {
    let id: String
    let segment: String
    let translation: String
    let source: String
    let target: String
    let quality: Int
    let reference: String?
    let usageCount: Int
    let subject: String
    let createdBy: String
    let lastUpdatedBy: String
    let createDate: String
    let lastUpdateDate: String
    let match: Int

    enum CodingKeys: String, CodingKey {
        case id
        case segment
        case translation
        case source
        case target
        case quality
        case reference
        case usageCount = "usage-count"
        case subject
        case createdBy = "created-by"
        case lastUpdatedBy = "last-updated-by"
        case createDate = "create-date"
        case lastUpdateDate = "last-update-date"
        case match
    }
}

struct APIResponse: Codable {
    let responseData: ResponseData
    let quotaFinished: Bool
    let mtLangSupported: String?
    let responseDetails: String
    let responseStatus: Int
    let responderId: String?
    let exceptionCode: String?
    let matches: [Match]

    enum CodingKeys: String, CodingKey {
        case responseData
        case quotaFinished
        case mtLangSupported
        case responseDetails
        case responseStatus
        case responderId
        case exceptionCode
        case matches
    }
}

*/
import Foundation

struct ResponseData: Codable {
    let translatedText: String
    let match: Double

    enum CodingKeys: String, CodingKey {
        case translatedText
        case match
    }
}

struct Match: Decodable {
    let id: String
    let segment: String
    let translation: String
    let source: String
    let target: String
    let quality: Any
    let reference: String?
    let usageCount: Int
    let subject: String
    let createdBy: String
    let lastUpdatedBy: String
    let createDate: String
    let lastUpdateDate: String
    let match: Double

    enum CodingKeys: String, CodingKey {
        case id
        case segment
        case translation
        case source
        case target
        case quality
        case reference
        case usageCount = "usage-count"
        case subject
        case createdBy = "created-by"
        case lastUpdatedBy = "last-updated-by"
        case createDate = "create-date"
        case lastUpdateDate = "last-update-date"
        case match
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        segment = try container.decode(String.self, forKey: .segment)
        translation = try container.decode(String.self, forKey: .translation)
        source = try container.decode(String.self, forKey: .source)
        target = try container.decode(String.self, forKey: .target)

        // Decode quality as either Int or String
        if let intValue = try? container.decode(Int.self, forKey: .quality) {
            quality = String(intValue)
        } else if let stringValue = try? container.decode(String.self, forKey: .quality) {
            quality = stringValue
        } else {
            throw DecodingError.dataCorruptedError(forKey: .quality, in: container, debugDescription: "Invalid quality value")
        }

      //  property = try container.decode(PropertyType.self, forKey: .propertyKey)
        reference = try container.decodeIfPresent(String.self, forKey: .reference)
        usageCount = try container.decode(Int.self, forKey: .usageCount)
        subject = try container.decode(String.self, forKey: .subject)
        createdBy = try container.decode(String.self, forKey: .createdBy)
        lastUpdatedBy = try container.decode(String.self, forKey: .lastUpdatedBy)
        createDate = try container.decode(String.self, forKey: .createDate)
        lastUpdateDate = try container.decode(String.self, forKey: .lastUpdateDate)
        match = try container.decode(Double.self, forKey: .match)
        
    }
}

struct APIResponse: Decodable {
    let responseData: ResponseData
    let quotaFinished: Bool?
    let mtLangSupported: String?
    let responseDetails: String
    let responseStatus: Int
    let responderId: String?
    let exceptionCode: String?
    let matches: [Match]

    enum CodingKeys: String, CodingKey {
        case responseData
        case quotaFinished
        case mtLangSupported
        case responseDetails
        case responseStatus
        case responderId
        case exceptionCode
        case matches
    }
}
