//
//  WeatherButtonUIView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 27.01.2025.
//

import SwiftUI

struct WeatherButtonUIView: View {
    
        var title: String = ""
        var backGroundColor: Color
        var foreGroundColor: Color
        var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backGroundColor)
                .foregroundColor(foreGroundColor)
                .font(.system(size: 20))
                .cornerRadius(10)
        }
}

#Preview {
    WeatherButtonUIView(title: "Title", backGroundColor: .red, foreGroundColor: .white)
}
