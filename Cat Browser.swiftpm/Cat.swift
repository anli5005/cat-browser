import SwiftUI

struct Cat: Identifiable, Decodable {
    var _id: String
    var tags: [String]

    var id: String { _id }    
}
