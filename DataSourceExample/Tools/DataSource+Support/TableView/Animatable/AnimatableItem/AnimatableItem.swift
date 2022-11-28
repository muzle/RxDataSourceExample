import UIKit
import RxDataSources

class AnimatableItem<Cell: UITableViewCell & ViewModelBindable>: TableViewCellModel<Cell>, AnimatableItemProtocol {
    
    // MARK: - Properties
    
    let identity: String
    
    // MARK: - Initialization
    
    init(
        identity: String,
        viewModel: Cell.ViewModel,
        selectionStyle: UITableViewCell.SelectionStyle = .none,
        eventTracker: EventTracker? = nil
    ) {
        self.identity = identity
        super.init(
            viewModel: viewModel,
            selectionStyle: selectionStyle,
            eventTracker: eventTracker
        )
    }
    
    // MARK: - Protocol methods
    
    static func == (
        lhs: AnimatableItem<Cell>,
        rhs: AnimatableItem<Cell>
    ) -> Bool {
        lhs.identity == rhs.identity
    }
}

// MARK: - Default implementation

extension AnimatableItem {
    func asAnyAnimatableItem() -> AnyAnimatableItem {
        AnyAnimatableItem(item: self)
    }
}
