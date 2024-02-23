import SwiftUI

struct ContentView: View {    
    @State var cats = [Cat]()
    @State var searchTerm = ""
    
    var searchedCats: [Cat] {
        if searchTerm.isEmpty {
            return cats
        }
        
        return cats.filter { cat in
            cat.tags.contains(where: { $0.localizedCaseInsensitiveContains(searchTerm) })
        }
    }
    
    var body: some View {
        NavigationStack {
            List(searchedCats) { cat in
                CatView(cat: cat)
            }
            .navigationTitle("Cats")
            .searchable(text: $searchTerm)
        }
        .task {
            do {
                let url = URL(string: "https://cataas.com/api/cats?limit=10")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                cats = try decoder.decode([Cat].self, from: data)
            } catch {
                print("Couldn't get cat: \(error)")
            }
        }
    }
}
