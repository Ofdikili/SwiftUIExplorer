//
//  BarcodeScannerUIView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct BarcodeScannerUIView: View {
    var body: some View {
        NavigationView {
            VStack(alignment:.center){
                Rectangle()
                    .frame(maxWidth:.infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                Label("Scanned Barcode:",systemImage: "barcode.viewfinder")
                    .font(.title)
                Text("Not Yet Scanned")
                    .font(.system(size: 28,weight: .bold))
                    .foregroundStyle(.red).padding()
            }.navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerUIView()
}
