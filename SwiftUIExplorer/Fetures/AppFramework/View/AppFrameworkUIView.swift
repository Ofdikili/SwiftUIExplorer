//
//  AppFrameworkUIView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 28.01.2025.
//

import SwiftUI

struct AppFrameworkUIView: View {
    var sampleFramework: Framework = Framework.getSampleFrameWork()
    var frameworks: [Framework] = Framework.getAllFrameWorks()
    
    let columns : [GridItem] = [
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible()),
        GridItem(.flexible()),

    ]
    var body: some View {
        NavigationView{
            ScrollView{
               LazyVGrid(columns: columns){
                   ForEach(frameworks , id :\.self){
                       framework in
                       FrameworkTitleView(framework: framework)
                   }
               }
           }.navigationTitle("Frameworks")
            
        }
    }
}




#Preview {
    AppFrameworkUIView()
}
