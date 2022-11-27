import Foundation
import RxSwift
import RxCocoa

enum TwoButtonUnit: UnitType {
    
    // MARK: - Types
    
    enum Event {
        case first, second
    }
    
    struct Input {
        let first: Signal<Void>
        let second: Signal<Void>
    }
    
    struct Output {
        let title: Driver<String?>
        let firstButtonTitle: Driver<String?>
        let secondButtonTitle: Driver<String?>
        let empty: Signal<Void>
    }
}
