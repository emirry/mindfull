//
//  FoodProps.swift
//  mindfull
//
//  Created by Emily Nagai on 2/3/21.
//

import Foundation

struct FoodData: Decodable {
    let calories: Int
}

//struct NutrientsObj: Decodable {
//    let kcal: CalorieInfo
//    let protein: ProteinInfo
//    let carbs: CarbInfo
//    let fat: FatInfo
//
//    private enum CodingKeys: String, CodingKey {
//        case kcal = "ENERC_KCAL"
//        case protein = "PROCNT"
//        case carbs = "CHOCDF"
//        case fat = "FAT"
//    }
//}
//
//struct CalorieInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct ProteinInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct CarbInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}
//
//struct FatInfo: Decodable {
//    let label: String
//    let quantity: Int
//    let fat: String
//}

