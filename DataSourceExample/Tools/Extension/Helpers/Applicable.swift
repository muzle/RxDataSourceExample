import Foundation

protocol Applicable { }

// MARK: - Default implementation

extension Applicable {
    func apply(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

// MARK: - NSObject + Applicable

extension NSObject: Applicable { }
