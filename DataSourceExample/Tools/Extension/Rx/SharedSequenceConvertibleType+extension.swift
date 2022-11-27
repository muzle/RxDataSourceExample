import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    func track<EventTracker: EventTrackerType>(
        with eventTracker: EventTracker
    ) -> SharedSequence<SharingStrategy, Void> where EventTracker.Event == Element {
        asSharedSequence()
            .do(onNext: eventTracker.handle(event:))
            .map { _ in }
    }
}
