import Foundation
import UIKit

class TableViewCellModel<Cell: UITableViewCell & ViewModelBindable> {
    
    // MARK: - Private properties
    
    private let viewModel: Cell.ViewModel
    
    // MARK: - Initialization
    
    init(viewModel: Cell.ViewModel) {
        self.viewModel = viewModel
    }
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(Cell.self, for: indexPath).apply {
            $0.bind(viewModel: viewModel)
        }
    }
}

protocol TableViewCellModelProtocol {

    // MARK: - Methods

    func cell(
        tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell
}
