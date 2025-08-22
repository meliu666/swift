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
    
    // MARK: - State Variables
    @State private var names: [String] = ["ss", "aa", "123", "qq"]
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            pickedNameView
            namesListView
            addNameTextField
            Divider()
            toggleRemoveOption
            pickNameButton
        }
        .padding()
    }
    
    // MARK: - Subviews
    
    private var pickedNameView: some View {
        Text(pickedName.isEmpty ? "No name picked yet" : pickedName)
            .bold()
            .font(.title2)
    }
    
    private var namesListView: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
            .onDelete(perform: delete)
        }
    }
    
    private var addNameTextField: some View {
        TextField("Add Name", text: $nameToAdd)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled()
            .onSubmit(addName)
    }
    
    private var toggleRemoveOption: some View {
        Toggle("Remove when picked", isOn: $shouldRemovePickedName)
    }
    
    private var pickNameButton: some View {
        Button("Pick Random Name", action: pickRandomName)
            .buttonStyle(.borderedProminent)
    }

    // MARK: - Functions
    
    private func addName() {
        guard !nameToAdd.isEmpty else { return }
        if !names.contains(nameToAdd) {
            names.append(nameToAdd)
        }
        nameToAdd = ""
    }
    
    private func delete(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
    }
    
    private func pickRandomName() {
        guard let randomName = names.randomElement() else {
            pickedName = ""
            return
        }
        
        pickedName = randomName
        
        if shouldRemovePickedName {
            names.removeAll { $0 == randomName }
        }
    }
}

#Preview {
    ContentView()
}
