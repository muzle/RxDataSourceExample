import Foundation
import RxDataSources

protocol AnimatableItemProtocol: TableViewCellModelProtocol, Equatable, IdentifiableType where Identity == String { }
