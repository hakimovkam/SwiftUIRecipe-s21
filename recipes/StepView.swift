//
//  StepView.swift
//  recipes
//
//  Created by Камиль Хакимов on 19.03.2023.
//

import SwiftUI

struct StepView: View {
    
    var step: Steps
    
    
    var body: some View {
        Text(step.description)
            .padding(30)
            .font(.subheadline)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(step: Steps(id: 1, description: "Pasta"))
    }
}
