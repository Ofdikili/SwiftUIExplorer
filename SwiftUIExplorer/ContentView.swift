//  ContentView.swift
//  SwiftUIExplorer
import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .font(.system(size: 20))
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(CustomButtonModifier())
    }
}

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    isNights: isNight,
                    startColor: isNight ? .black : .blue,
                    endColor: isNight ? .gray : .white
                )
                
                VStack(spacing: 15) {
                    NavigationLink(destination: WeatherContentUIView()) {
                        Text("Weather App")
                            .customButtonStyle()
                    }
                    
                    NavigationLink(destination: AppFrameworkUIView()) {
                        Text("App Framework")
                            .customButtonStyle()
                    }
                    
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

