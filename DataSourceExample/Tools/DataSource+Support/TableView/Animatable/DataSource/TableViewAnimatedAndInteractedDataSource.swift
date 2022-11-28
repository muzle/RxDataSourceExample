import UIKit
import RxSwift
import RxDataSources

// swiftlint:disable all
final class TableViewAnimatedAndInteractedDataSource: RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>, UITableViewDelegate {
 
    // MARK: - Override methods
    
    override func tableView(
        _ tableView: UITableView,
        observedEvent: Event<RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>.Element>
    ) {
        tableView.delegate = self
        super.tableView(tableView, observedEvent: observedEvent)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self[indexPath].track(event: .didSelect)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self[indexPath].track(event: .didDeselect)
    }
}
// swiftlint:enable all
