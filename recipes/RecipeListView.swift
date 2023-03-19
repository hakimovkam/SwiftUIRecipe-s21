//
//  ContentView.swift
//  recipes
//
//  Created by Rene Tilda on 19.03.2023.
//

import SwiftUI

struct RecipeListView: View {
    
    var recipes: [Recipe]?
    
    
    init() {
        self.recipes = readJSONFile()
    }
    
    var body: some View {
        NavigationView {
            List(recipes ?? [], id: \.id) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 115, height: 75, alignment: .center)
                        .cornerRadius(10)
                        .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        Text(recipe.title)
                            .frame(alignment: .top)
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                        Text(recipe.description)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 80)
                }

            }
            .navigationTitle("Recipes")
        }
    }
    
    func readJSONFile() -> [Recipe] {
        guard let url = Bundle.main.url(forResource: "recipes.json", withExtension: nil) else {
            return []
        }
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        let decoder = JSONDecoder()
        guard let recipes = try? decoder.decode([Recipe].self, from: data) else {
            return []
        }
        return recipes
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .previewInterfaceOrientation(.portrait)
    }
}
