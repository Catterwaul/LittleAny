import Cast

public extension Equatable {
  /// Equate two values of unknown types.
  /// - Throws: `Cast.Error` if `both operands` cannot be cast to this type.
  static func equate(_ uncast0: some Any, _ uncast1: some Any) throws(Cast.Error) -> Bool {
    let (self0, self1) = try cast((uncast0, uncast1)) as (Self, Self)
    return self0 == self1
  }
}
