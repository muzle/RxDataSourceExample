import Foundation
import RxSwift
import RxCocoa

enum OneButtonUnit: UnitType {
    
    // MARK: - Types
    
    enum Event {
        case first
    }
    
    struct Input {
        let first: Signal<Void>
    }
    
    struct Output {
        let title: Driver<String?>
        let buttonTitle: Driver<String?>
        let empty: Signal<Void>
    }
}
