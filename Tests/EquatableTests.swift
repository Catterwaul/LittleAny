import Cast
import LittleAny
import Testing

struct EquatableTests {
  @Test func equate() throws {
    let int: some Any = Int.random(in: 1...10)
    let bool: any Any = Bool.random()
    #expect(try Int.equate(int, int))
    #expect(throws: CastError.self) { try Bool.equate(bool, int) }
    #expect(try AnyHashable.equate(bool, bool))
    #expect(try AnyHashable.equate(bool, int) == false)

    struct Equatable: Swift.Equatable { }
    #expect(try Equatable.equate(Equatable(), Equatable()))
  }

  @Test func equals() throws {
    #expect(try "😾".equals("😾" as Any))
    #expect(try "😾".equals("🦮" as any Equatable) == false)
    #expect(try (cast("😾") as any Equatable).equals("😾"))
    #expect(throws: CastError.self) { try "😾".equals(0) }

    let cupcake = "🧁"
    let notCake = ~0xca_e

    let cupcakeEquals = cupcake.equals as (Any) throws(_) -> _
    #expect(try cupcakeEquals(cupcake))
    #expect(throws: CastError.self) { try cupcakeEquals(notCake) }
  }
}
