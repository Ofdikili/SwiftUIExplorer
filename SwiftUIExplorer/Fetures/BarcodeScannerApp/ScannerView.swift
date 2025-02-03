//
//  ScannerView.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import Foundation
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode : String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sccannerView: self)    }
    
    func makeUIViewController(context: Context) -> some ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: some ScannerViewController, context: Context) {
        
    }
    
    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        private let scannerView: ScannerView
        init(sccannerView: ScannerView) {
            self.scannerView = sccannerView
        }
        func didSurfaceError(error: CameraError) {
            print(error.rawValue)
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode

        }
        
      
    }
}
