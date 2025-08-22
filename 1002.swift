import SwiftUI

@main
struct KKKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



struct ContentView: View {
    @State private var numberOfPips : Int = 5
    
    var body: some View {
        
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(width: 100,height: 100)
            
            Button("Rolls"){
                numberOfPips = Int.random(in: 1...6)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}

