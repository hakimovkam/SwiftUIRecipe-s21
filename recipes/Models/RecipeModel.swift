
//  RecipeModel.swift
//  recipes
//
//  Created by Rene Tilda on 19.03.2023.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    let id: Int
    let title: String
    let image: String
    let description: String
    let steps: [Steps]

}

struct Steps: Identifiable, Decodable {
    let id: Int
    let description: String
}

