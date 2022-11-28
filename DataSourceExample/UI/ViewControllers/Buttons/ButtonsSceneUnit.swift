import RxSwift
import RxCocoa

enum ButtonsSceneUnit: UnitType {
    struct Input {
        let update: Signal<Void>
    }
    
    struct Output {
        let dataSource: Driver<AnyAnimatableSections>
    }
}
