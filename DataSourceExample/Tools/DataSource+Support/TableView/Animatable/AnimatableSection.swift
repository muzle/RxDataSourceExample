import Foundation
import RxDataSources

struct AnimatableSection<Item: IdentifiableType & Hashable>: AnimatableSectionModelType {
    
    // MARK: - Properties
    
    var header: String?
    var items: [Item]
    
    var identity: String {
        (header ?? "") + items.map(\.identity.hashValue).map(String.init).joined(separator: "_")
    }
    
    // MARK: - Initialization
    
    init(header: String?, items: [Item]) {
        self.header = header
        self.items = items
    }
    
    init(original: AnimatableSection<Item>, items: [Item]) {
        self = original
        self.items = items
    }
}
