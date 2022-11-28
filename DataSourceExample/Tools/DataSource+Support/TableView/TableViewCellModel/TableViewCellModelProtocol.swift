import UIKit

protocol TableViewCellModelProtocol {

    // MARK: - Methods

    func cell(
        tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell
    
    func track(event: CellEvent)
}
