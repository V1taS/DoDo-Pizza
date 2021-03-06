//
//  Pizza.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let pizza: [Pizza]?
}

// MARK: - Pizza
struct Pizza: Codable {
    let id: Int?
    let nameRu, description: String?
    let price: Int?
    let urlPreview: String?

    enum CodingKeys: String, CodingKey {
        case id, nameRu
        case description
        case price, urlPreview
    }
}
