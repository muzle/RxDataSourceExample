import Foundation
import RxSwift
import RxCocoa

final class TwoButtonViewModel: ViewModelType {
    
    // MARK: - Types
    
    typealias Unit = TwoButtonUnit
    typealias EventTracker = Unit.EventTracker
    
    struct Configuration {
        let title, firstButtonTitle, secondButtonTitle: String?
    }
    
    // MARK: - Private properties
    
    private let configuration: Configuration
    private let eventTracker: EventTracker
    
    // MARK: - Initialization
    
    init(
        configuration: Configuration,
        eventTracker: EventTracker
    ) {
        self.configuration = configuration
        self.eventTracker = eventTracker
    }
    
    // MARK: - Protocol methods
    
    func transform(input: Unit.Input) -> Unit.Output {
        let event = Signal
            .merge(
                input.first.map { Unit.Event.first },
                input.second.map { Unit.Event.second }
            )
            .track(with: eventTracker)
        
        return Unit.Output(
            title: .just(configuration.title),
            firstButtonTitle: .just(configuration.firstButtonTitle),
            secondButtonTitle: .just(configuration.secondButtonTitle),
            empty: event
        )
    }
}
