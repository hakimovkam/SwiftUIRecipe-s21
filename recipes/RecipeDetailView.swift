//
//  RecipeDetailView.swift
//  recipes
//
//  Created by Камиль Хакимов on 19.03.2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            VStack {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text(recipe.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .cornerRadius(5)
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 10)
            }
            .frame(height: UIScreen.main.bounds.height / 3)
            Text("Steps")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 25)
            List(recipe.steps, id: \.id) { step in
                NavigationLink(destination: StepView(step: step)) {
                    Text(step.description)
                        .cornerRadius(5)
                }
            }
            .cornerRadius(20)
            .padding([.leading, .trailing], 25)
            .padding(.bottom, 25)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetailView(recipe:  RecipeListView().readJSONFile()[0])
        }
    }
}

