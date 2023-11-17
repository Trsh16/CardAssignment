//
//  Card.swift
//  CardAssignment
//
//  Created by MacBook Pro on 17/11/23.
//

import Foundation

// MARK: - Temperatures
class Card: Codable {
    var object: String
    var totalCards: Int
    var hasMore: Bool
    var data: [Datum]

    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case data
    }

    init(object: String, totalCards: Int, hasMore: Bool, data: [Datum]) {
        self.object = object
        self.totalCards = totalCards
        self.hasMore = hasMore
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable {
    var object: DatumObject
    var id, oracleID: String
    var multiverseIDS: [Int]
    var mtgoID, arenaID, tcgplayerID: Int
    var cardmarketID: Int?
    var name: String
    var lang: Lang
    var releasedAt: String
    var uri, scryfallURI: String
    var layout: Layout
    var highresImage: Bool
    var imageStatus: ImageStatus
    var imageUris: ImageUris?
    var manaCost: String
    var cmc: Int
    var typeLine: TypeLine
    var oracleText: String
    var colors, colorIdentity: [ColorIdentity]
    var keywords: [String]
    var legalities: Legalities
    var games: [Game]
    var reserved, foil, nonfoil: Bool
    var finishes: [Finish]
    var oversized, promo, reprint, variation: Bool
    var setID: String
    var datumSet: Set
    var setName: SetName
    var setType: SetType
    var setURI, setSearchURI, scryfallSetURI, rulingsURI: String
    var printsSearchURI: String
    var collectorNumber: String
    var digital: Bool
    var rarity: Rarity
    var flavorText: String?
    var cardBackID, artist: String
    var artistIDS: [String]
    var illustrationID: String
    var borderColor: BorderColor
    var frame: String
    var frameEffects: [FrameEffect]
    var securityStamp: SecurityStamp?
    var fullArt, textless, booster, storySpotlight: Bool
    var promoTypes: [PromoType]
    var edhrecRank: Int
    var pennyRank: Int?
    var prices: [String: String?]
    var relatedUris: RelatedUris
    var purchaseUris: PurchaseUris
    var allParts: [AllPart]?
    var preview: Preview?
    var producedMana: [ColorIdentity]?

    enum CodingKeys: String, CodingKey {
        case object, id
        case oracleID = "oracle_id"
        case multiverseIDS = "multiverse_ids"
        case mtgoID = "mtgo_id"
        case arenaID = "arena_id"
        case tcgplayerID = "tcgplayer_id"
        case cardmarketID = "cardmarket_id"
        case name, lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case colors
        case colorIdentity = "color_identity"
        case keywords, legalities, games, reserved, foil, nonfoil, finishes, oversized, promo, reprint, variation
        case setID = "set_id"
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity
        case flavorText = "flavor_text"
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case frameEffects = "frame_effects"
        case securityStamp = "security_stamp"
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case promoTypes = "promo_types"
        case edhrecRank = "edhrec_rank"
        case pennyRank = "penny_rank"
        case prices
        case relatedUris = "related_uris"
        case purchaseUris = "purchase_uris"
        case allParts = "all_parts"
        case preview
        case producedMana = "produced_mana"
    }

    init(object: DatumObject, id: String, oracleID: String, multiverseIDS: [Int], mtgoID: Int, arenaID: Int, tcgplayerID: Int, cardmarketID: Int?, name: String, lang: Lang, releasedAt: String, uri: String, scryfallURI: String, layout: Layout, highresImage: Bool, imageStatus: ImageStatus, imageUris: ImageUris, manaCost: String, cmc: Int, typeLine: TypeLine, oracleText: String, colors: [ColorIdentity], colorIdentity: [ColorIdentity], keywords: [String], legalities: Legalities, games: [Game], reserved: Bool, foil: Bool, nonfoil: Bool, finishes: [Finish], oversized: Bool, promo: Bool, reprint: Bool, variation: Bool, setID: String, datumSet: Set, setName: SetName, setType: SetType, setURI: String, setSearchURI: String, scryfallSetURI: String, rulingsURI: String, printsSearchURI: String, collectorNumber: String, digital: Bool, rarity: Rarity, flavorText: String?, cardBackID: String, artist: String, artistIDS: [String], illustrationID: String, borderColor: BorderColor, frame: String, frameEffects: [FrameEffect], securityStamp: SecurityStamp?, fullArt: Bool, textless: Bool, booster: Bool, storySpotlight: Bool, promoTypes: [PromoType], edhrecRank: Int, pennyRank: Int?, prices: [String: String?], relatedUris: RelatedUris, purchaseUris: PurchaseUris, allParts: [AllPart]?, preview: Preview?, producedMana: [ColorIdentity]?) {
        self.object = object
        self.id = id
        self.oracleID = oracleID
        self.multiverseIDS = multiverseIDS
        self.mtgoID = mtgoID
        self.arenaID = arenaID
        self.tcgplayerID = tcgplayerID
        self.cardmarketID = cardmarketID
        self.name = name
        self.lang = lang
        self.releasedAt = releasedAt
        self.uri = uri
        self.scryfallURI = scryfallURI
        self.layout = layout
        self.highresImage = highresImage
        self.imageStatus = imageStatus
        self.imageUris = imageUris
        self.manaCost = manaCost
        self.cmc = cmc
        self.typeLine = typeLine
        self.oracleText = oracleText
        self.colors = colors
        self.colorIdentity = colorIdentity
        self.keywords = keywords
        self.legalities = legalities
        self.games = games
        self.reserved = reserved
        self.foil = foil
        self.nonfoil = nonfoil
        self.finishes = finishes
        self.oversized = oversized
        self.promo = promo
        self.reprint = reprint
        self.variation = variation
        self.setID = setID
        self.datumSet = datumSet
        self.setName = setName
        self.setType = setType
        self.setURI = setURI
        self.setSearchURI = setSearchURI
        self.scryfallSetURI = scryfallSetURI
        self.rulingsURI = rulingsURI
        self.printsSearchURI = printsSearchURI
        self.collectorNumber = collectorNumber
        self.digital = digital
        self.rarity = rarity
        self.flavorText = flavorText
        self.cardBackID = cardBackID
        self.artist = artist
        self.artistIDS = artistIDS
        self.illustrationID = illustrationID
        self.borderColor = borderColor
        self.frame = frame
        self.frameEffects = frameEffects
        self.securityStamp = securityStamp
        self.fullArt = fullArt
        self.textless = textless
        self.booster = booster
        self.storySpotlight = storySpotlight
        self.promoTypes = promoTypes
        self.edhrecRank = edhrecRank
        self.pennyRank = pennyRank
        self.prices = prices
        self.relatedUris = relatedUris
        self.purchaseUris = purchaseUris
        self.allParts = allParts
        self.preview = preview
        self.producedMana = producedMana
    }
}

// MARK: - AllPart
class AllPart: Codable {
    var object: AllPartObject
    var id: String
    var component: Component
    var name, typeLine: String
    var uri: String

    enum CodingKeys: String, CodingKey {
        case object, id, component, name
        case typeLine = "type_line"
        case uri
    }

    init(object: AllPartObject, id: String, component: Component, name: String, typeLine: String, uri: String) {
        self.object = object
        self.id = id
        self.component = component
        self.name = name
        self.typeLine = typeLine
        self.uri = uri
    }
}

enum Component: String, Codable {
    case comboPiece = "combo_piece"
    case token = "token"
}

enum AllPartObject: String, Codable {
    case relatedCard = "related_card"
}

enum BorderColor: String, Codable {
    case borderless = "borderless"
}

enum ColorIdentity: String, Codable {
    case b = "B"
    case g = "G"
    case r = "R"
    case u = "U"
    case w = "W"
}

enum Set: String, Codable {
    case wot = "wot"
}

enum Finish: String, Codable {
    case foil = "foil"
    case nonfoil = "nonfoil"
}

enum FrameEffect: String, Codable {
    case showcase = "showcase"
}

enum Game: String, Codable {
    case arena = "arena"
    case mtgo = "mtgo"
    case paper = "paper"
}

enum ImageStatus: String, Codable {
    case highresScan = "highres_scan"
}

// MARK: - ImageUris
class ImageUris: Codable {
    var small, normal, large: String
    var png: String
    var artCrop, borderCrop: String

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }

    init(small: String, normal: String, large: String, png: String, artCrop: String, borderCrop: String) {
        self.small = small
        self.normal = normal
        self.large = large
        self.png = png
        self.artCrop = artCrop
        self.borderCrop = borderCrop
    }
}

enum Lang: String, Codable {
    case en = "en"
}

enum Layout: String, Codable {
    case normal = "normal"
}

// MARK: - Legalities
class Legalities: Codable {
    var standard, future, historic, gladiator: Alchemy
    var pioneer, explorer, modern, legacy: Alchemy
    var pauper: Alchemy
    var vintage: Vintage
    var penny, commander, oathbreaker, brawl: Alchemy
    var historicbrawl, alchemy, paupercommander, duel: Alchemy
    var oldschool, premodern, predh: Alchemy

    init(standard: Alchemy, future: Alchemy, historic: Alchemy, gladiator: Alchemy, pioneer: Alchemy, explorer: Alchemy, modern: Alchemy, legacy: Alchemy, pauper: Alchemy, vintage: Vintage, penny: Alchemy, commander: Alchemy, oathbreaker: Alchemy, brawl: Alchemy, historicbrawl: Alchemy, alchemy: Alchemy, paupercommander: Alchemy, duel: Alchemy, oldschool: Alchemy, premodern: Alchemy, predh: Alchemy) {
        self.standard = standard
        self.future = future
        self.historic = historic
        self.gladiator = gladiator
        self.pioneer = pioneer
        self.explorer = explorer
        self.modern = modern
        self.legacy = legacy
        self.pauper = pauper
        self.vintage = vintage
        self.penny = penny
        self.commander = commander
        self.oathbreaker = oathbreaker
        self.brawl = brawl
        self.historicbrawl = historicbrawl
        self.alchemy = alchemy
        self.paupercommander = paupercommander
        self.duel = duel
        self.oldschool = oldschool
        self.premodern = premodern
        self.predh = predh
    }
}

enum Alchemy: String, Codable {
    case banned = "banned"
    case legal = "legal"
    case notLegal = "not_legal"
}

enum Vintage: String, Codable {
    case legal = "legal"
    case restricted = "restricted"
}

enum DatumObject: String, Codable {
    case card = "card"
}

// MARK: - Preview
class Preview: Codable {
    var source: String
    var sourceURI: String
    var previewedAt: String

    enum CodingKeys: String, CodingKey {
        case source
        case sourceURI = "source_uri"
        case previewedAt = "previewed_at"
    }

    init(source: String, sourceURI: String, previewedAt: String) {
        self.source = source
        self.sourceURI = sourceURI
        self.previewedAt = previewedAt
    }
}

enum PromoType: String, Codable {
    case boosterfun = "boosterfun"
}

// MARK: - PurchaseUris
class PurchaseUris: Codable {
    var tcgplayer, cardmarket, cardhoarder: String

    init(tcgplayer: String, cardmarket: String, cardhoarder: String) {
        self.tcgplayer = tcgplayer
        self.cardmarket = cardmarket
        self.cardhoarder = cardhoarder
    }
}

enum Rarity: String, Codable {
    case mythic = "mythic"
    case rare = "rare"
    case uncommon = "uncommon"
}

// MARK: - RelatedUris
class RelatedUris: Codable {
    var gatherer: String
    var tcgplayerInfiniteArticles, tcgplayerInfiniteDecks, edhrec: String

    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerInfiniteArticles = "tcgplayer_infinite_articles"
        case tcgplayerInfiniteDecks = "tcgplayer_infinite_decks"
        case edhrec
    }

    init(gatherer: String, tcgplayerInfiniteArticles: String, tcgplayerInfiniteDecks: String, edhrec: String) {
        self.gatherer = gatherer
        self.tcgplayerInfiniteArticles = tcgplayerInfiniteArticles
        self.tcgplayerInfiniteDecks = tcgplayerInfiniteDecks
        self.edhrec = edhrec
    }
}

enum SecurityStamp: String, Codable {
    case oval = "oval"
}

enum SetName: String, Codable {
    case wildsOfEldraineEnchantingTales = "Wilds of Eldraine: Enchanting Tales"
}

enum SetType: String, Codable {
    case masterpiece = "masterpiece"
}

enum TypeLine: String, Codable {
    case enchantment = "Enchantment"
    case enchantmentAura = "Enchantment — Aura"
    case enchantmentAuraCurse = "Enchantment — Aura Curse"
    case tribalEnchantmentFaerie = "Tribal Enchantment — Faerie"
}
