//
//  Category.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import Foundation

// Create the diffent category enum to identfy and apply filter
enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
