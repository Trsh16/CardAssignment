import SwiftUI

struct ContentView: View {
    @State private var cards: Card?

    var body: some View {
        NavigationView {
            VStack {
                if let card = cards {
                    CardView(card: card)
                        .padding()
                } else {
                    Text("Loading...")
                        .onAppear(perform: loadData)
                }
            }.navigationTitle("Scryfall")
                .toolbarColorScheme(.light, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }

    // Function to load and parse the JSON data
    func loadData() {
        if let url = Bundle.main.url(forResource: "WOT-Scryfall", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let cardList = try decoder.decode(Card.self, from: data)
                self.cards = cardList
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }
}

struct CardView: View {
    var card: Card

        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]

        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(card.data, id: \.id) { datum in
                        NavigationLink(destination: CardDetailView(datum: datum)) {
                            DatumView(datum: datum)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)             
                        }
                    }
                }
                .padding(16)
            }
        }
}

struct CardDetailView: View {
    var datum: Datum

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: datum.imageUris?.artCrop ?? "")) { phase in
                AsyncImage(url: URL(string: datum.imageUris?.artCrop ?? "")) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                case .failure:
                                    Text("Failed to load image")
                                case .empty:
                                    Text("Loading...")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 200, height: 200)
            }
            .frame(width: 200, height: 200)

            Text("Name: \(datum.name)")
            Text("Type Line: \(datum.typeLine.rawValue)")
            Text("Mana Cost: \(datum.manaCost)")
            LegalitiesView(legalities: datum.legalities)

            // Add more Text views for other properties you want to display
        }
        .navigationBarTitle(datum.name, displayMode: .inline)
    }
}

struct LegalitiesView: View {
    var legalities: Legalities

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Standard: \(legalities.standard.rawValue)")
            Text("Modern: \(legalities.modern.rawValue)")
            Text("Vintage: \(legalities.vintage.rawValue)")
            Text("Alchemy: \(legalities.alchemy.rawValue)")
            // Add more legalities as needed
        }
    }
}

struct DatumView: View {
    var datum: Datum

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: datum.imageUris?.normal ?? "")) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            case .failure:
                                Text("Failed to load image")
                            case .empty:
                                Text("Loading...")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 200, height: 200)
            Text(datum.name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .frame(width: 100)
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
