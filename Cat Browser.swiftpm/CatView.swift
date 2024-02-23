import SwiftUI

struct CatView: View {
    var cat: Cat
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://cataas.com/cat/\(cat.id)")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .background(.tertiary)
            .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("A Cat")
                    .fontWeight(.bold)
                Text(cat.tags.joined(separator: ", "))
                    .foregroundStyle(.secondary)
            }
        }
    }
}
