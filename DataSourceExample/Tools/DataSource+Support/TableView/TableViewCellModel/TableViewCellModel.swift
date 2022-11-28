import Foundation
import UIKit

class TableViewCellModel<Cell: UITableViewCell & ViewModelBindable>: TableViewCellModelProtocol {
    
    // MARK: - Types
    
    typealias EventTracker = AnyEventTracker<CellEvent>
    
    // MARK: - Private properties
    
    private let viewModel: Cell.ViewModel
    private let selectionStyle: UITableViewCell.SelectionStyle
    private let eventTracker: EventTracker?
    
    // MARK: - Initialization
    
    init(
        viewModel: Cell.ViewModel,
        selectionStyle: UITableViewCell.SelectionStyle = .none,
        eventTracker: EventTracker? = nil
    ) {
        self.viewModel = viewModel
        self.selectionStyle = selectionStyle
        self.eventTracker = eventTracker
    }
    
    // MARK: - Protocol methods
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(Cell.self, for: indexPath).apply {
            $0.bind(viewModel: viewModel)
            $0.selectionStyle = selectionStyle
        }
    }
    
    func track(event: CellEvent) {
        eventTracker?.handle(event: event)
    }
}
