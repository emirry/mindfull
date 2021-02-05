//
//  PostList.swift
//  mindfull-swift
//
//  Created by Emily Nagai on 1/31/21.


import Foundation
import SwiftUI

struct FoodItemRow: View {
    var foodProps: Response

    var body: some View {
        HStack {
            Text(foodProps.text)
            Text(foodProps.measure)

            Spacer()
        }
    }
}

struct FoodItemRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemRow(foodProps: landmarks[1])
    }
}

////struct Response: Codable {
////    var results: [Result]
////}
////
////struct Result: Codable {
////    var id: Int
////    var first_name: String/Users/emilynagai/Desktop/Ada-Capstone/mindfull/mindfull-swift/mindfull-swift/Supporting Views/ReuseableViews
////}
//
//struct PostList: View {
////    @State var results = [Result]()
////    
////    var body: some View {
////        List(results, id: \.id) { item in
////            VStack(alignment: .leading) {
////                Text(item.first_name)
////                    .font(.headline)
////            }
////        }
////        .onAppear(perform: loadData)
////
////    }
////    
////    func loadData() {
////        guard let url = URL(string: "https://reqres.in/users") else {
////            print("Invalid URL")
////            return
////        }
////        
////        let request = URLRequest(url: url)
////        
////        URLSession.shared.dataTask(with: request) { data, response, error in
////            if let data = data {
////                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
////                    DispatchQueue.main.async {
////                        self.results = decodedResponse.results
////                    }
////                    
////                    return
////                }
////            }
////            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
////        }.resume()
////    }
//}
//
//struct PostList_Previews: PreviewProvider {
//    static var previews: some View {
//        PostList()
//    }
//}