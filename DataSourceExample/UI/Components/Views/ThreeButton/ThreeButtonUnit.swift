import Foundation
import RxSwift
import RxCocoa

enum ThreeButtonUnit: UnitType {
    
    // MARK: - Types
    
    enum Event {
        case first, second, third
    }
    
    struct Input {
        let first: Signal<Void>
        let second: Signal<Void>
        let third: Signal<Void>
    }
    
    struct Output {
        let title: Driver<String?>
        let firstButtonTitle: Driver<String?>
        let secondButtonTitle: Driver<String?>
        let thirdButtonTitle: Driver<String?>
        let empty: Signal<Void>
    }
}
