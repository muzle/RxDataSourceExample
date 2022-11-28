import Foundation
import UIKit
import RxDataSources

// swiftlint:disable all
final class TableViewInteractionManager<Section: SectionModelType>: NSObject, UITableViewDelegate where Section.Item: TableViewCellModelProtocol {
    
    // MARK: - Types
    
    typealias DataSource = TableViewSectionedDataSource<Section>
    
    // MARK: - Private properties
    
    private weak var dataSource: DataSource?
    
    // MARK: - Initalization
    
    init(dataSource: DataSource? = nil) {
        self.dataSource = dataSource
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource?[indexPath].track(event: .didSelect)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        dataSource?[indexPath].track(event: .didDeselect)
    }
}
// swiftlint:enable all
