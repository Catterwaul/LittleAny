import Cast
import LittleAny
import Testing

struct EquatableTests {
  @Test func equate() throws {
    let int: some Any = Int.random(in: 1...10)
    let bool: any Any = Bool.random()
    #expect(try Int.equate(int, int))
    #expect(throws: Cast.Error.self) { try Bool.equate(bool, int) }
    #expect(try AnyHashable.equate(bool, bool))
    #expect(try AnyHashable.equate(bool, int) == false)

    struct Equatable: Swift.Equatable { }
    #expect(try Equatable.equate(Equatable(), Equatable()))
  }
}
