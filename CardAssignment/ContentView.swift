import SwiftUI

struct ContentView: View {
    @State private var cards: Card?
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search cards")
                
                if let card = cards {
                    CardView(card: card, searchText: searchText)
                        .padding()
                } else {
                    Text("Loading...")
                        .onAppear(perform: loadData)
                }
            }
            .navigationTitle("Scryfall")
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
    var searchText: String

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(card.data.filter {
                    searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                }, id: \.id) { datum in
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

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(16)
    }
}


struct CardDetailView: View {
    @State private var isImageTapped = false

    var datum: Datum

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 100) {

                    // Use a single AsyncImage with a TapGesture
                    AsyncImage(url: URL(string: datum.imageUris?.artCrop ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100, alignment: .top)
                                .onTapGesture {
                                    // Set a flag to show a larger image when tapped
                                    isImageTapped = true
                                }
                        case .failure:
                            Text("Failed to load image")
                        case .empty:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100, alignment: .top)
                                .onTapGesture {
                                    isImageTapped = true
                                }
                        @unknown default:
                            EmptyView()
                        }
                    }

                    Spacer()

                    VStack(alignment: .leading) {
                        Text("Name: \(datum.name)").bold()
                        Text("Type Line: \(datum.typeLine.rawValue)")
                        Text("Mana Cost: \(datum.manaCost)")
                        Text("LEGALITIES").bold()
                        LegalitiesView(legalities: datum.legalities)
                    }
                    .padding()
                }
                .navigationBarTitle(datum.name, displayMode: .inline)
            }
        }
        .sheet(isPresented: $isImageTapped) {
            // This is the sheet that will appear when the image is tapped
            LargerImageView(url: URL(string: datum.imageUris?.normal ?? ""))
        }
    }
}

struct LargerImageView: View {
    var url: URL?

    var body: some View {
        // Create a view to display the larger image
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .failure:
                    Text("Failed to load larger image")
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Text("Invalid URL")
        }
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
            Text("Brawl: \(legalities.brawl.rawValue)")
            Text("Commander: \(legalities.commander.rawValue)")
            Text("Duel: \(legalities.duel.rawValue)")
            Text("Explorer: \(legalities.explorer.rawValue)")
            Text("Future: \(legalities.future.rawValue)")
            Text("Gladiator: \(legalities.gladiator.rawValue)")
            Text("Historic: \(legalities.historic.rawValue)")
            Text("HistoricBrawl: \(legalities.historicbrawl.rawValue)")
            Text("Legacy: \(legalities.legacy.rawValue)")
            Text("Oathbreaker: \(legalities.oathbreaker.rawValue)")
            Text("Oldschool: \(legalities.oldschool.rawValue)")
            Text("Pauper: \(legalities.pauper.rawValue)")
            Text("PauperCommander: \(legalities.paupercommander.rawValue)")
            Text("Penny: \(legalities.penny.rawValue)")
            Text("Pioneer: \(legalities.pioneer.rawValue)")
            Text("Predh: \(legalities.predh.rawValue)")
            Text("Premodern: \(legalities.premodern.rawValue)")
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
