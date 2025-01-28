//
//  FrameWorkDetailUIView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 29.01.2025.
//

import SwiftUI

struct FrameWorkDetailUIView : View {
    var frameWork: Framework
    @Binding var isShowDetailView: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowDetailView.toggle()

                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }.padding()
            Spacer()
            FrameworkTitleView(framework: frameWork)
            Text(frameWork.description)
                .font(.body)
                .padding()
            Spacer()
            Button{
            } label: {
                Text("Learn More")
                    .font(.title2)
                    .frame(width: 280, height: 50)
                    .background(.red)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    var sampleFramework: Framework = Framework.getSampleFrameWork()
    FrameWorkDetailUIView(frameWork: sampleFramework, isShowDetailView:.constant(false))
}
