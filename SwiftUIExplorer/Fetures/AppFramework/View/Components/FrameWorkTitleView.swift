//
//  FrameWorkTitleView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 29.01.2025.
//

import SwiftUI

    struct FrameworkTitleView : View{
        var framework : Framework
        var body : some View {
            VStack{
                Image(framework.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .scaledToFit()
                    .minimumScaleFactor(0.9)
            }
        }
    
}

#Preview {
    var sampleFramework: Framework = Framework.getSampleFrameWork()
    FrameworkTitleView(framework: sampleFramework)
}
