import UIKit
import RxDataSources

struct AnyAnimatableItem: AnimatableItemProtocol {
    
    // MARK: - Private properties
    
    private let item: TableViewCellModelProtocol
    let identity: String
    let equatableBox: Box
    
    // MARK: - Initialization
    
    init<Item: AnimatableItemProtocol>(item: Item) {
        self.item = item
        self.identity = item.identity
        self.equatableBox = EquatableBox(value: item)
    }
    
    // MARK: - Protocol methods
    
    func cell(
        tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        item.cell(tableView: tableView, indexPath: indexPath)
    }
    
    func track(event: CellEvent) {
        item.track(event: event)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.equatableBox.isEqual(to: rhs.equatableBox)
    }
}

// MARK: - Boxies

extension AnyAnimatableItem {
    
    // MARK: - Box
    
    class Box {
        
        // MARK: - Properties
        
        let value: Any
        
        // MARK: - Initialization
        
        init(value: Any) {
            self.value = value
        }
        
        // MARK: - Methods
        
        func isEqual(to other: Box) -> Bool {
            preconditionFailure("\(#function) must be overrided")
        }
    }
    
    // MARK: - EquatableBox
    
    private final class EquatableBox<E: Equatable>: Box {
        
        // MARK: - Initalization
        
        init(value: E) {
            super.init(value: value)
        }
        
        // MARK: - Override methods
        
        override func isEqual(to other: AnyAnimatableItem.Box) -> Bool {
            guard
                let lhs = value as? E,
                let rhs = other.value as? E
            else { return false }
            
            return lhs == rhs
        }
    }
}
