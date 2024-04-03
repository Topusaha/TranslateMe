//
//  Translate.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

import Foundation


struct ResponseTranslate: Codable {
    struct ResponseData: Codable {
        let translatedText: String
        let match: Int
    }

    let responseData: ResponseData
    let quotaFinished: Bool
    let mtLangSupported: String?
    let responseDetails: String
    let responseStatus: Int
    let responderId: String?
    let exceptionCode: String?
    let matches: [Match]
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
}
