import SwiftUI

@main
struct KKKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayFor(day: "Monday", isRainy:true,high:30)
            DayFor(day: "Tuesday", isRainy:false,high:30,low: 20)
        }
    }
}


struct DayFor : View {
    let day : String
    let isRainy : Bool
    let high : Int
    var low : Int = 15
    
    var iconName : String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
  
    var body: some View {
        VStack {
            Text(day)
            Image(systemName: iconName)
            Text("high:\(high)")
            Text("low:\(low)")
        }
    }
}


#Preview {
    ContentView()
}
