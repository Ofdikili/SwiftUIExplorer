//  ContentView.swift
//  SwiftUIExplorer
import SwiftUI
struct WeatherContentUIView: View {
    @State private var isNight = false
    var body: some View {
        ZStack(){
            BackgroundView(
                isNights: isNight,
                startColor:isNight ? .black : .blue, endColor:isNight ? .gray : .white)
            VStack{
                CityNameView(cityName: "Ankara , TR")
                MainWeatherStatusView(degree: 76 , imageName:
                                        isNight ? "moon.stars.fill" :     "cloud.sun.fill")
                HStack(spacing:10){
                    DailyWeatherView(dayOfWeek: "TUE", imageSystemName: "cloud.sun.fill",
                                     degreeOfDay: 28
                    )
                    DailyWeatherView(dayOfWeek: "WED", imageSystemName: "sun.max.fill",
                                     degreeOfDay: 28
                    )
                    DailyWeatherView(dayOfWeek: "THU", imageSystemName: "wind.snow",
                                     degreeOfDay: 28
                    )
                    DailyWeatherView(dayOfWeek: "FRI", imageSystemName: "sunset.fill",
                                     degreeOfDay: 28
                    )
                    DailyWeatherView(dayOfWeek: "SAT", imageSystemName: "snow",
                                     degreeOfDay: 28
                    )
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButtonUIView(
                        title: "Change Day Time", backGroundColor: .white, foreGroundColor: .blue
                    )
                }
                Spacer()
                
            }
            
        }
    }
}

struct BackgroundView:View {
    var isNights : Bool
    var startColor : Color
    var endColor : Color
    var body : some View {
        LinearGradient(gradient: Gradient(colors:
           [isNights ? .red : startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct DailyWeatherView : View {
    var dayOfWeek : String
    var imageSystemName : String
    var degreeOfDay : Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
            Image(systemName: imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(degreeOfDay) °C")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct CityNameView: View {
    var cityName: String = ""
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var degree : Int = 0
    var imageName : String = ""
    var body: some View {
        VStack(alignment: .center,spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160,height: 160)
            Text("\(degree) °C")
                .font(.system(size: 70, weight: .medium,design:.none))
                .foregroundStyle(.white)
        }.padding(.bottom,40)
    }
}

#Preview {
    WeatherContentUIView()
}

