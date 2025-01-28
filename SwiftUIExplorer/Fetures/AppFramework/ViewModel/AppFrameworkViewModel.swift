//
//  AppFrameworkViewModel.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 29.01.2025.
//
import SwiftUI

class AppFrameworkViewModel: ObservableObject {
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView: Bool = false
}
