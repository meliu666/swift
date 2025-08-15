import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(isRainy: true, high: 70, low:20)
            
            DayForecast(isRainy: false, high: 60)
        }
    }
}

#Preview {
    ContentView()
}


struct DayForecast: View {
    let day: String = "day"
    let isRainy: Bool
    let high: Int
    var low: Int = 15
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
