import UIKit
import RxSwift
import RxDataSources

// swiftlint:disable all
final class TableViewAnimatedDataSource: RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>{
    
    // MARK: - Types
    
    private typealias InteractionManager = TableViewInteractionManager<AnyAnimatableSection>
    
    // MARK: - Private properties
    
    private lazy var interactionManager = InteractionManager(dataSource: self)
 
    // MARK: - Override methods
    
    override func tableView(
        _ tableView: UITableView,
        observedEvent: Event<RxTableViewSectionedAnimatedDataSource<AnyAnimatableSection>.Element>
    ) {
        tableView.delegate = interactionManager
        super.tableView(tableView, observedEvent: observedEvent)
    }
}
// swiftlint:enable all
