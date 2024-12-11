//
//  NewsAPIResponse.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import Foundation

// this is API response model
struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
